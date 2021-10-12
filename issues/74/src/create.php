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

// テーブル作成
$params = [
  'TableName' => 'Persons',
  'KeySchema' => [
    [
      'AttributeName' => 'name',
      'KeyType' => 'HASH'
    ]
  ],
  'AttributeDefinitions' => [
    [
      'AttributeName' => 'name',
      'AttributeType' => 'S'
    ]
  ],
  'ProvisionedThroughput' => [
    'ReadCapacityUnits' => 10,
    'WriteCapacityUnits' => 10
  ]
];

$result = $dynamoDb->createTable($params);
var_dump($result);


