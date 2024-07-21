<?php
include_once 'Database.php';
include_once 'User.php';
include_once 'session.php';

$database = new Database();
$db = $database->getConnection();
$user = new User($db);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user->email = $_POST['email'];
    $user->password = $_POST['password'];

    $user_data = $user->getUserByEmail();

    if ($user->login()) {
        $_SESSION['user_id'] = $user->id;
        header("Location: profile.php");
    } else {
        echo "Invalid email or password.";
    }
}
?>
