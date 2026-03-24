<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$conn = new mysqli("localhost", "root", "", "skidb");

$data = json_decode(file_get_contents("php://input"), true);

$first_name = $data["first_name"] ?? "";
$last_name = $data["last_name"] ?? "";
$email = $data["email"] ?? "";
$password = $data["password"] ?? "";

if (!$first_name || !$last_name || !$email || !$password) {
    echo json_encode(["status" => "error", "message" => "Brak danych"]);
    exit;
}

$sql = "INSERT INTO users (first_name, last_name, email, password_hash)
        VALUES ('$first_name', '$last_name', '$email', '$password')";

if ($conn->query($sql)) {
    echo json_encode(["status" => "ok"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}