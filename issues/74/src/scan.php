<?php

require_once __DIR__ . '/vendor/autoload.php';

use Aws\Sdk;
use Aws\DynamoDb\Marshaler;

$sdk = new Sdk([
  'endpoint' => 'dynamodb:8000',
  'region' => 'ap-northeast-1',
  'version' => 'latest',
  'aws_access_key_id' => 'fake', 
  'aws_secret_access_key' => 'fake'
]);
$dynamoDb = $sdk->createDynamoDb();
$marshaler = new Marshaler();

$result = $dynamoDb->scan([
  'TableName' => 'Persons'
]);

foreach ($result['Items'] as $item) {
  $person = $marshaler->unmarshalItem($item);
  var_dump($person);
}
