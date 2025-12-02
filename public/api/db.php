<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Detect environment
$isDocker = getenv('DOCKER_ENV') !== false || file_exists('/.dockerenv');
$isLocal = in_array($_SERVER['SERVER_NAME'], ['localhost', '127.0.0.1']);

if ($isDocker) {
    // Docker environment - use service name
    $servername = "db";  // Docker service name
    $username = "ahmetcak_admin";
    $password = "YFatFw9K5WPJnJkVAUeH";
    $dbname = "ahmetcak_db";
} elseif ($isLocal) {
    // Local XAMPP/WAMP
    $servername = "localhost";
    $username = "ahmetcak_admin";
    $password = "YFatFw9K5WPJnJkVAUeH";
    $dbname = "ahmetcak_db";
} else {
    // Production
    $servername = "localhost";
    $username = "ahmetcak_admin";
    $password = "YFatFw9K5WPJnJkVAUeH";
    $dbname = "ahmetcak_db";
}

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8mb4", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "error" => "Connection failed: " . $e->getMessage(),
        "env" => $isDocker ? "docker" : ($isLocal ? "local" : "production")
    ]);
    exit();
}
?>