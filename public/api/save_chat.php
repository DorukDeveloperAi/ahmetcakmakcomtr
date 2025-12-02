<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (!empty($data->user_message) && !empty($data->bot_response)) {
        try {
            $user_message = htmlspecialchars(strip_tags($data->user_message));
            $bot_response = htmlspecialchars(strip_tags($data->bot_response));
            $ip_address = $_SERVER['REMOTE_ADDR'];

            $stmt = $conn->prepare("INSERT INTO chat_logs (user_message, bot_response, ip_address) VALUES (:user_message, :bot_response, :ip_address)");
            $stmt->bindParam(':user_message', $user_message);
            $stmt->bindParam(':bot_response', $bot_response);
            $stmt->bindParam(':ip_address', $ip_address);

            if ($stmt->execute()) {
                http_response_code(201);
                echo json_encode(["message" => "Chat log saved successfully."]);
            } else {
                http_response_code(503);
                echo json_encode(["message" => "Unable to save chat log."]);
            }
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(["error" => "Database error: " . $e->getMessage()]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["message" => "Incomplete data."]);
    }
} else {
    http_response_code(405);
    echo json_encode(["message" => "Method not allowed."]);
}
?>