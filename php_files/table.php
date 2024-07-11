<!DOCTYPE html>
<html>
<head>
    <title>Data table</title>
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Password</th>
        </tr>
        <?php
        $servername = "127.0.0.1";
        $username_db = "root";
        $password_db = "";
        $db_name = "task2";

        $conn = new mysqli($servername, $username_db, $password_db, $db_name);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT username, password FROM tbl_task2";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["username"]. "</td><td>" . $row["password"]. "</td></tr>";
            }
        } else {
            echo "0 results";
        }
        $conn->close();
        ?>
    </table>
</body>
</html>
