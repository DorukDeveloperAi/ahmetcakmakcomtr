<?php
include 'db.php';

header('Content-Type: application/json');

try {
    // Get JSON input
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['message'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Message is required']);
        exit;
    }

    // Helper function to normalize Turkish characters
    function normalizeString($str)
    {
        $str = mb_strtolower($str, 'UTF-8');
        $search = ['ı', 'ğ', 'ü', 'ş', 'ö', 'ç', 'İ', 'Ğ', 'Ü', 'Ş', 'Ö', 'Ç'];
        $replace = ['i', 'g', 'u', 's', 'o', 'c', 'i', 'g', 'u', 's', 'o', 'c'];
        return str_replace($search, $replace, $str);
    }

    $userMessage = normalizeString($data['message']);
    $lang = isset($data['lang']) ? $data['lang'] : 'tr';

    // Fetch all knowledge base entries for the requested language
    $stmt = $conn->prepare("SELECT keywords, answer FROM chat_knowledge_base WHERE lang = ?");
    $stmt->execute([$lang]);
    $entries = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $foundAnswer = null;

    foreach ($entries as $entry) {
        // Normalize keywords from database as well
        $keywords = explode(',', $entry['keywords']);
        foreach ($keywords as $keyword) {
            $normalizedKeyword = normalizeString(trim($keyword));
            if (!empty($normalizedKeyword) && strpos($userMessage, $normalizedKeyword) !== false) {
                $foundAnswer = $entry['answer'];
                break 2; // Break both loops
            }
        }
    }

    if ($foundAnswer) {
        echo json_encode(['found' => true, 'answer' => $foundAnswer]);
    } else {
        echo json_encode(['found' => false]);
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
?>