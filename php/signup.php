<?php
include_once 'Database.php';
include_once 'User.php';
include_once 'session.php';


$database = new Database();
$db = $database->getConnection();
$user = new User($db);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user->username = $_POST['username'];
    $user->email = $_POST['email'];
    $user->password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    if ($user->create()) {
        echo "User registered successfully.";
    } else {
        echo "Failed to register user.";
    }
}
?>
