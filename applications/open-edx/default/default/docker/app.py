#!/usr/bin/env python3
import os
import sys
import time
import secrets
import hashlib
from datetime import datetime
from functools import wraps
from flask import (
    Flask, request, render_template, redirect, url_for,
    session, jsonify, make_response
)
import pymysql

app = Flask(__name__, template_folder="templates")
app.secret_key = os.environ.get("SECRET_KEY", secrets.token_hex(32))

# Configuration
DB_HOST = os.environ.get("DB_HOST", "db")
DB_PORT = int(os.environ.get("DB_PORT", "3306"))
DB_USER = os.environ.get("DB_USER", "openedx")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "openedx_password")
DB_NAME = os.environ.get("DB_NAME", "openedx")

ADMIN_EMAIL = os.environ.get("ADMIN_EMAIL", "admin@example.com")
ADMIN_USERNAME = os.environ.get("ADMIN_USERNAME", "admin")
ADMIN_PASSWORD = os.environ.get("ADMIN_PASSWORD", "AdminPassword123!")

FALLBACK_USERS = {
    ADMIN_USERNAME: {
        "id": 1,
        "username": ADMIN_USERNAME,
        "email": ADMIN_EMAIL,
        "password": ADMIN_PASSWORD,
        "role": "Administrator",
        "is_superuser": 1,
        "is_staff": 1
    },
    ADMIN_EMAIL: {
        "id": 1,
        "username": ADMIN_USERNAME,
        "email": ADMIN_EMAIL,
        "password": ADMIN_PASSWORD,
        "role": "Administrator",
        "is_superuser": 1,
        "is_staff": 1
    },
    "instructor": {
        "id": 2,
        "username": "instructor",
        "email": "instructor@example.com",
        "password": "InstructorPassword123!",
        "role": "Staff",
        "is_superuser": 0,
        "is_staff": 1
    },
    "instructor@example.com": {
        "id": 2,
        "username": "instructor",
        "email": "instructor@example.com",
        "password": "InstructorPassword123!",
        "role": "Staff",
        "is_superuser": 0,
        "is_staff": 1
    },
    "student": {
        "id": 3,
        "username": "student",
        "email": "student@example.com",
        "password": "StudentPassword123!",
        "role": "Student",
        "is_superuser": 0,
        "is_staff": 0
    },
    "student@example.com": {
        "id": 3,
        "username": "student",
        "email": "student@example.com",
        "password": "StudentPassword123!",
        "role": "Student",
        "is_superuser": 0,
        "is_staff": 0
    }
}

COURSES = [
    {
        "course_id": "course-v1:HarvardX+CS50+2026",
        "title": "CS50: Introduction to Computer Science",
        "organization": "HarvardX",
        "description": "An introduction to the intellectual enterprises of computer science and the art of programming.",
        "pacing": "self-paced",
        "code": "CS50x"
    },
    {
        "course_id": "course-v1:MITx+6.00.1x+2026",
        "title": "Introduction to Computer Science and Programming Using Python",
        "organization": "MITx",
        "description": "An introduction to computer science as a tool to solve real-world analytical problems using Python 3.",
        "pacing": "self-paced",
        "code": "6.00.1x"
    },
    {
        "course_id": "course-v1:MITx+6.002x+2026",
        "title": "Circuits and Electronics 1: Basic Circuit Analysis",
        "organization": "MITx",
        "description": "Learn techniques that are foundational to the design of microchips used in smartphones and laptops.",
        "pacing": "self-paced",
        "code": "6.002x"
    },
    {
        "course_id": "course-v1:SecSys+SEC101+2026",
        "title": "Web Application Security & Penetration Testing",
        "organization": "SecSys",
        "description": "Comprehensive hands-on training for discovering and remediating OWASP Top 10 vulnerabilities in modern web architectures.",
        "pacing": "self-paced",
        "code": "SEC101"
    },
    {
        "course_id": "course-v1:HarvardX+PH525.1x+2026",
        "title": "Data Science: R Basics",
        "organization": "HarvardX",
        "description": "Build a foundation in R and learn how to wrangle, analyze, and visualize data.",
        "pacing": "self-paced",
        "code": "PH525.1x"
    }
]

def get_db_connection():
    try:
        conn = pymysql.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            charset="utf8mb4",
            cursorclass=pymysql.cursors.DictCursor,
            connect_timeout=3
        )
        return conn
    except Exception as e:
        return None

def init_db():
    print(f"Connecting to MySQL database at {DB_HOST}:{DB_PORT}...", flush=True)
    for attempt in range(30):
        try:
            conn = pymysql.connect(
                host=DB_HOST,
                port=DB_PORT,
                user=DB_USER,
                password=DB_PASSWORD,
                database=DB_NAME,
                charset="utf8mb4",
                cursorclass=pymysql.cursors.DictCursor,
                connect_timeout=3
            )
            with conn.cursor() as cur:
                cur.execute("""
                    CREATE TABLE IF NOT EXISTS auth_user (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        username VARCHAR(150) NOT NULL UNIQUE,
                        email VARCHAR(254) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        is_superuser TINYINT(1) DEFAULT 0,
                        is_staff TINYINT(1) DEFAULT 0,
                        is_active TINYINT(1) DEFAULT 1,
                        first_name VARCHAR(150) DEFAULT '',
                        last_name VARCHAR(150) DEFAULT '',
                        date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
                """)
                cur.execute("""
                    INSERT INTO auth_user (username, email, password, is_superuser, is_staff, is_active, first_name, last_name)
                    VALUES 
                    (%s, %s, %s, 1, 1, 1, 'System', 'Admin')
                    ON DUPLICATE KEY UPDATE password=VALUES(password);
                """, (ADMIN_USERNAME, ADMIN_EMAIL, ADMIN_PASSWORD))
                conn.commit()
            conn.close()
            print("Database initialized successfully!", flush=True)
            return True
        except Exception as e:
            time.sleep(1)
    print("Database init timed out, using persistent fallback handler.", flush=True)
    return False

def authenticate_user(login_identifier, password):
    if not login_identifier or not password:
        return None
    login_identifier = login_identifier.strip()
    
    # Try MySQL
    conn = get_db_connection()
    if conn:
        try:
            with conn.cursor() as cur:
                cur.execute(
                    "SELECT * FROM auth_user WHERE (username=%s OR email=%s) AND is_active=1 LIMIT 1",
                    (login_identifier, login_identifier)
                )
                user = cur.fetchone()
                if user:
                    stored_pwd = user.get("password", "")
                    if stored_pwd == password or stored_pwd == hashlib.sha256(password.encode()).hexdigest():
                        return {
                            "id": user["id"],
                            "username": user["username"],
                            "email": user["email"],
                            "role": "Administrator" if user.get("is_superuser") else ("Staff" if user.get("is_staff") else "Student"),
                            "is_superuser": user.get("is_superuser", 0),
                            "is_staff": user.get("is_staff", 0)
                        }
        except Exception as e:
            pass
        finally:
            conn.close()

    # Fallback in-memory
    if login_identifier in FALLBACK_USERS:
        u = FALLBACK_USERS[login_identifier]
        if u["password"] == password:
            return u
    return None

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user" not in session:
            return redirect(url_for("login", next=request.url))
        return f(*args, **kwargs)
    return decorated_function

def get_or_create_csrf():
    if "csrf_token" not in session:
        session["csrf_token"] = secrets.token_hex(32)
    return session["csrf_token"]

# Routes
@app.route("/")
def index():
    csrf = get_or_create_csrf()
    resp = make_response(render_template(
        "index.html",
        title="Welcome to Open edX",
        courses=COURSES
    ))
    resp.set_cookie("csrftoken", csrf)
    return resp

@app.route("/login", methods=["GET", "POST"])
def login():
    csrf = get_or_create_csrf()
    next_url = request.args.get("next") or request.form.get("next") or "/dashboard"
    error = None

    if request.method == "POST":
        identifier = (
            request.form.get("email_or_username") or
            request.form.get("email") or
            request.form.get("username") or
            request.form.get("_username")
        )
        password = (
            request.form.get("password") or
            request.form.get("_password")
        )

        user = authenticate_user(identifier, password)
        if user:
            session["user"] = user
            resp = make_response(redirect(next_url))
            resp.set_cookie("sessionid", session.sid if hasattr(session, "sid") else secrets.token_hex(16))
            resp.set_cookie("edx-jwt-cookie-header-payload", secrets.token_hex(24))
            resp.set_cookie("csrftoken", csrf)
            return resp
        else:
            error = "The email or password you entered is incorrect."

    resp = make_response(render_template(
        "login.html",
        title="Sign in",
        csrf_token=csrf,
        next_url=next_url,
        error=error
    ))
    resp.set_cookie("csrftoken", csrf)
    return resp

@app.route("/login_ajax", methods=["POST"])
@app.route("/user_api/v1/account/login_session/", methods=["POST"])
def login_ajax():
    csrf = get_or_create_csrf()
    data = request.get_json(silent=True) or request.form
    identifier = (
        data.get("email_or_username") or
        data.get("email") or
        data.get("username") or
        data.get("_username")
    )
    password = (
        data.get("password") or
        data.get("_password")
    )

    user = authenticate_user(identifier, password)
    if user:
        session["user"] = user
        resp = jsonify({
            "success": True,
            "redirect_url": "/dashboard",
            "user": {
                "username": user["username"],
                "email": user["email"],
                "role": user["role"]
            }
        })
        resp.set_cookie("sessionid", secrets.token_hex(16))
        resp.set_cookie("edx-jwt-cookie-header-payload", secrets.token_hex(24))
        resp.set_cookie("csrftoken", csrf)
        return resp
    else:
        return jsonify({
            "success": False,
            "error": "The email or password you entered is incorrect."
        }), 400

@app.route("/dashboard")
@login_required
def dashboard():
    return render_template(
        "dashboard.html",
        title="Dashboard",
        courses=COURSES
    )

@app.route("/courses")
def courses():
    return render_template(
        "courses.html",
        title="Courses Catalog",
        courses=COURSES
    )

@app.route("/courses/<course_id>/about")
def course_about(course_id):
    course = next((c for c in COURSES if c["course_id"] == course_id), None)
    if not course:
        course = {
            "course_id": course_id,
            "title": f"Course: {course_id}",
            "organization": "Open edX",
            "description": "Comprehensive interactive online course offering by Open edX.",
            "code": "EDX101",
            "pacing": "self-paced"
        }
    return render_template(
        "course_about.html",
        title=course["title"],
        course=course
    )

@app.route("/account/settings")
@login_required
def account_settings():
    return render_template(
        "account_settings.html",
        title="Account Settings"
    )

@app.route("/logout")
def logout():
    session.clear()
    resp = make_response(redirect("/"))
    resp.delete_cookie("sessionid")
    resp.delete_cookie("edx-jwt-cookie-header-payload")
    return resp

@app.route("/health")
@app.route("/heartbeat")
def health():
    return jsonify({
        "status": "ok",
        "service": "open-edx-lms",
        "timestamp": datetime.utcnow().isoformat(),
        "database": "connected" if get_db_connection() else "fallback"
    })

if __name__ == "__main__":
    init_db()
    app.run(host="0.0.0.0", port=8000)
