<?php


require_once __DIR__ . '/vendor/autoload.php';

use Aws\Sdk;

$sdk = new Sdk([
  'endpoint' => 'dynamodb:8000',
  'region' => 'ap-northeast-1',
  'version' => 'latest',
  'aws_access_key_id' => 'fake', 
  'aws_secret_access_key' => 'fake'
]);
$dynamoDb = $sdk->createDynamoDb();

$result = $dynamoDb->listTables();
var_dump($result);

