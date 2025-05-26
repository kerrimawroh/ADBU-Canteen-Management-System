<?php
include('db.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['login'])) {
    $email = $_POST['user_email'];
    $password = $_POST['user_pass'];

    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if (password_verify($password, $row['password'])) {
            session_regenerate_id(true); 
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['email'] = $row['email'];

            header("Location: welcome.php");
            exit();
        } else {
            $error = "Invalid Password.";
        }
    } else {
        $error = "Invalid Email.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <link rel="stylesheet" href="style3.css">
</head>
<body>

  <div class="login-container">
    <div class="login-box">
      <h2>Login</h2>

      <?php if (isset($error)) { echo "<p class='error'>$error</p>"; } ?>

      <form method="POST" action="" autocomplete="off">
          <input type="email" name="user_email" id="email" placeholder="Enter Email" autocomplete="off" required><br><br>

          <input type="password" name="user_pass" id="password" placeholder="Enter Password" autocomplete="new-password" required><br><br>

          <button type="submit" name="login">Login</button>
      </form>

      <p>Don't have an account? <a href="register.php">Register here</a></p>
    </div>
  </div>

</body>
</html>