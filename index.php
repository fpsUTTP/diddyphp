<?php
// Get the visitor's IP address
function getUserIP() {
    // Check for shared internet/Proxies
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        // For proxies
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

$visitor_ip = getUserIP();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Show My IP</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        h1 { color: #333; }
        p { font-size: 1.5rem; }
    </style>
</head>
<body>
    <h1>Your IP Address</h1>
    <p><?php echo htmlspecialchars($visitor_ip); ?></p>
</body>
</html>
