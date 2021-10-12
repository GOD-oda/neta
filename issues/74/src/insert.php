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

$items = [
  [
    'name' => 'foo'
  ],
  [
    'name' => 'bar'
  ]
];

foreach ($items as $item) {
  $result = $dynamoDb->putItem([
    'TableName' => 'Persons',
    'Item' => $marshaler->marshalJson(json_encode($item))
  ]);
  var_dump($result);
}
