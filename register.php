<?php
include('db.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['register'])) {
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $username = $_POST['username'];

    $sql_check = "SELECT * FROM users WHERE email='$email'";
    $result_check = $conn->query($sql_check);

    if ($result_check->num_rows > 0) {
        $error = "Email already registered.";
    } else {
       
        $sql = "INSERT INTO users (email, password, username) VALUES ('$email', '$password', '$username')";
        if ($conn->query($sql) === TRUE) {
      
            header("Location: login.php?");
            echo "Registration Sucessful";
            exit();
        } else {
            $error = "Error: Unable to register user.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register</title>
  <link rel="stylesheet" href="style3.css">
</head>
<body>

  <div class="login-container">
    <div class="login-box">
      <h2>Register</h2>

  
      <?php if (isset($error)) { echo "<p class='error'>$error</p>"; } ?>

      <form method="POST" action="" autocomplete="off">
          <input type="email" name="email" id="email" placeholder="Enter Email" autocomplete="off" required><br>
          <input type="password" name="password" id="password" placeholder="Enter Password" autocomplete="new-password" required><br>
          <input type="text" name="username" id="username" placeholder="Enter Name" autocomplete="off" required><br>
          <button type="submit" name="register">Register</button>
      </form>

      <p>Already have an account? <a href="login.php">Login here</a></p>
    </div>
  </div>

</body>
</html>
