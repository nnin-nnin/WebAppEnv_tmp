<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:login.php');
    exit();
}

// Database connection (Compose supplies DB_HOST/DB_NAME to connection1.php).
require_once __DIR__ . '/connection1.php';

if ($conn->connect_error) {
    die('Could not Connect MySQL Server: ' . $conn->connect_error);
}

// Form submission logic
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);
    $dob = mysqli_real_escape_string($conn, $_POST['dob']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $mobile = mysqli_real_escape_string($conn, $_POST['mobile']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);

    $sql = "INSERT INTO clients (name, gender, dob, email, mobile, address) 
            VALUES ('$name', '$gender', '$dob', '$email', '$mobile', '$address')";

    if (mysqli_query($conn, $sql)) {
        echo "<script>alert('New record has been added successfully!');</script>";
    } else {
        echo "Error: " . $sql . " - " . mysqli_error($conn);
    }
}

mysqli_close($conn);

include("../auth/header.php");
include("../auth/sidebar.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
</head>
<body>

<div class="page-content">
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Registration Form</h6>
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="exampleInputText1" class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" id="exampleInputText1" placeholder="Enter Name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Gender</label><br>
                            <input type="radio" name="gender" value="Male" id="mgender" required>
                            <label for="mgender">Male</label>
                            <input type="radio" name="gender" value="Female" id="fgender" required>
                            <label for="fgender">Female</label>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Date Of Birth:</label>
                            <input type="date" class="form-control" name="dob" required>
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputEmail3" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail3" placeholder="Enter Email" required>
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputMobile" class="form-label">Mobile Number</label>
                            <input type="text" class="form-control" name="mobile" id="exampleInputMobile" placeholder="Mobile number" required>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Address</label>
                            <textarea class="form-control" name="address" id="exampleFormControlTextarea1" rows="3" required></textarea>
                        </div>

                        <button class="btn btn-primary" name="submit" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include("../auth/footer.php"); ?>

</body>
</html>
