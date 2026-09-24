<?php
session_start();
error_reporting(0);

if (!isset($_SESSION['username'])) {
    header('location:login.php');
    exit();
}

include("../auth/header.php");
include("../auth/sidebar.php");
include 'connection1.php';

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
        echo '<link rel="stylesheet" href="popup_style.css">
        <div class="popup popup--icon -success js_success-popup popup--visible">
            <div class="popup__background"></div>
            <div class="popup__content">
                <h3 class="popup__content__title">Success</h3>
                <p>Record added Successfully</p>
                <p><script>setTimeout(() => { window.location.href = "client_data.php"; }, 1500);</script></p>
            </div>
        </div>';

        // Send Email Notification
        require 'PHPMailer/src/Exception.php';
        require 'PHPMailer/src/PHPMailer.php';
        require 'PHPMailer/src/SMTP.php';
        
        $mail = new PHPMailer\PHPMailer\PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'mail.raghavinfocom.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'no_reply@raghavinfocom.com';
        $mail->Password = 'zo?n6BDVGtdo';
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;
        $mail->isHTML(true);
        $mail->setFrom('no_reply@raghavinfocom.com', 'Drkalan Front');
        $mail->addAddress($email, $name);
        $mail->Subject = 'Client Registered Successfully';
        $mail->Body = 'Hi ' . $name . ', your registration was successful.';

        if (!$mail->send()) {
            echo "<script>alert('Email could not be sent. Error: " . $mail->ErrorInfo . "');</script>";
        }
    } else {
        echo "Error: " . $sql . " - " . mysqli_error($conn);
    }
    mysqli_close($conn);
}
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
                    <form action="" method="post" enctype="multipart/form-data" class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="Enter Name" required>
                        </div>

                        <div class="col-md-6 d-flex align-items-center justify-content-evenly">
                            <label class="form-label">Gender</label>
                            <input type="radio" name="gender" value="Male" id="mgender" required>
                            <label for="mgender">Male</label>
                            <input type="radio" name="gender" value="Female" id="fgender" required>
                            <label for="fgender">Female</label>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" name="dob" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Mobile number" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" name="address" id="address" rows="3" required></textarea>
                        </div>

                        <div class="col-md-6">
                            <button class="btn btn-primary" name="submit" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include("../auth/footer.php"); ?>
</body>
</html>
