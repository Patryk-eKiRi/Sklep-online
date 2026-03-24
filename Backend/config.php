<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Content-Type: application/json; charset=UTF-8");

$host = 'localhost';
$dbname = 'skidb';
$user = 'root';
$password = '';
$charset = 'utf8mb4';

try {
    $conn = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=$charset",
        $user,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Błąd połączenia z DB"]);
    exit;
}
