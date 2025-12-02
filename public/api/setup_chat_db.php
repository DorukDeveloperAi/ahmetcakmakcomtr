<?php
include 'db.php';

try {
    // Chat Logs Table
    $sql = "CREATE TABLE IF NOT EXISTS chat_logs (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_message TEXT NOT NULL,
        bot_response TEXT NOT NULL,
        ip_address VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";

    $conn->exec($sql);

    echo json_encode(["message" => "Chat logs table created successfully."]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Setup failed: " . $e->getMessage()]);
}
?>