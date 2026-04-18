<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "nk_samobor_juniori2";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Greška pri spajanju na bazu: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");
?>