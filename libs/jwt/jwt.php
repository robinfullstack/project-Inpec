<?php

require '../../vendor/autoload.php';

use \Firebase\JWT\JWT;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$privateKey = file_get_contents('./jwtRS256.key');

$payload = array(
  // Unique user id string
  "sub" => "4j3w128qxe12t5k6pikg2t0uagkjgvawiikatg5n1eh6h249",

  // Full name of user
  "name" => "Robinson Pulgarin Torres",

  // Optional custom user root path
  // "https://claims.tiny.cloud/drive/root" => "/johndoe",

  // 10 minutes expiration
  "exp" => time() + 60 * 10
);

try {
  $token = JWT::encode($payload, $privateKey, 'RS256');
  http_response_code(200);
  header('Content-Type: application/json');
  echo json_encode(array("token" => $token));
} catch (Exception $e) {
  http_response_code(500);
  header('Content-Type: application/json');
  echo $e->getMessage();
}