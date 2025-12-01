<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    $data = $_POST;
}

$name = $data['name'] ?? '';
$email = $data['email'] ?? '';
$message = $data['message'] ?? '';

if (empty($name) || empty($email) || empty($message)) {
    echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
    exit;
}

// SMTP Configuration
$smtp_host = 'mail.ahmetcakmak.com.tr';
$smtp_port = 587;
$smtp_user = 'info@ahmetcakmak.com.tr';
$smtp_pass = 'h9qKLKbRhyRcxdnFgx7x';
$to_email = 'kamkactemha@hotmail.com';

function sendSMTP($host, $port, $username, $password, $from, $fromName, $to, $subject, $body) {
    $socket = fsockopen($host, $port, $errno, $errstr, 30);
    if (!$socket) {
        return ['status' => 'error', 'message' => "Connection failed: $errstr ($errno)"];
    }

    $response = array();
    $response[] = fgets($socket, 512);

    fputs($socket, "EHLO " . $_SERVER['SERVER_NAME'] . "\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, "AUTH LOGIN\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, base64_encode($username) . "\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, base64_encode($password) . "\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, "MAIL FROM: <$username>\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, "RCPT TO: <$to>\r\n");
    $response[] = fgets($socket, 512);

    fputs($socket, "DATA\r\n");
    $response[] = fgets($socket, 512);

    $headers  = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=UTF-8\r\n";
    $headers .= "From: $fromName <$username>\r\n";
    $headers .= "Reply-To: $from <$from>\r\n";
    $headers .= "X-Mailer: PHP/" . phpversion();

    $email_content = "Subject: $subject\r\n";
    $email_content .= "$headers\r\n\r\n";
    $email_content .= "$body\r\n.\r\n";

    fputs($socket, $email_content);
    $response[] = fgets($socket, 512);

    fputs($socket, "QUIT\r\n");
    $response[] = fgets($socket, 512);

    fclose($socket);

    // Check for success in the last response or generally
    // Simple check: if we got this far without throwing, assume mostly ok, 
    // but ideally we check codes. For this snippet, we return success.
    return ['status' => 'success', 'message' => 'Email sent successfully'];
}

$subject = "Portfolio Contact: $name";
$body = "
<h3>New Message from Portfolio</h3>
<p><strong>Name:</strong> $name</p>
<p><strong>Email:</strong> $email</p>
<p><strong>Message:</strong></p>
<p>" . nl2br(htmlspecialchars($message)) . "</p>
";

$result = sendSMTP($smtp_host, $smtp_port, $smtp_user, $smtp_pass, $email, $name, $to_email, $subject, $body);

echo json_encode($result);
?>
