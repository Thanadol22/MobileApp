<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

$servername = "localhost";
$username = "root"; // แก้ให้ตรงกับ XAMPP ของคุณ
$password = "";
$dbname = "finalapp"; // ✅ ใช้ชื่อ database ของคุณ

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die(json_encode(["error" => $conn->connect_error]));
}

// ------------------------------------------------
// ✅ กรณี Flutter ส่งข้อมูลใหม่ (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents("php://input"), true);

    if (isset($input['NAME']) && isset($input['phone']) && isset($input['map_link'])) {
        $name = $conn->real_escape_string($input['NAME']);
        $phone = $conn->real_escape_string($input['phone']);
        $map = $conn->real_escape_string($input['map_link']);

        $sql = "INSERT INTO studentinfo (NAME, phone, map_link) VALUES ('$name', '$phone', '$map')";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(["success" => true, "message" => "เพิ่มข้อมูลสำเร็จ"]);
        } else {
            echo json_encode(["success" => false, "message" => $conn->error]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "ข้อมูลไม่ครบ"]);
    }
    exit;
}

// ------------------------------------------------
// ✅ กรณี Flutter ดึงข้อมูล (GET)
$sql = "SELECT * FROM studentinfo ORDER BY id DESC";
$result = $conn->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data, JSON_UNESCAPED_UNICODE);
$conn->close();
?>
