<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (!empty($username) && !empty($password)) {
        
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $servername = "127.0.0.1";
        $username_db = "root";
        $password_db = "";
        $db_name = "task2";

        $conn = new mysqli($servername, $username_db, $password_db, $db_name);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $stmt = $conn->prepare("INSERT INTO tbl_task2 (username, password) VALUES ('$username','$hashed_password')");
        // $stmt->bind_param("ss", $username, $hashed_password);

        if ($stmt->execute()) {
            echo "User registered successfully.";
        } else {
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
        $conn->close();
    } else {
        echo "Username and password cannot be empty.";
    }
}
?>
