```sh
% docker-compose up
```
# Sample
1. テーブルの確認
```sh
% sh bin/list-tables.sh
{
    "TableNames": []
}
```

2. テーブルの作成
```sh
% TABLE=SampleTable bin/create-table.sh
{
    "TableDescription": {
        "AttributeDefinitions": [
            {
                "AttributeName": "userId",
                "AttributeType": "N"
            },
            {
                "AttributeName": "userName",
                "AttributeType": "S"
            }
        ],
        "TableName": "SampleTable",
        "KeySchema": [
            {
                "AttributeName": "userId",
                "KeyType": "HASH"
            },
            {
                "AttributeName": "userName",
                "KeyType": "RANGE"
            }
        ],
        "TableStatus": "ACTIVE",
        "CreationDateTime": "2021-08-30T22:49:37.677000+09:00",
        "ProvisionedThroughput": {
            "LastIncreaseDateTime": "1970-01-01T09:00:00+09:00",
            "LastDecreaseDateTime": "1970-01-01T09:00:00+09:00",
            "NumberOfDecreasesToday": 0,
            "ReadCapacityUnits": 0,
            "WriteCapacityUnits": 0
        },
        "TableSizeBytes": 0,
        "ItemCount": 0,
        "TableArn": "arn:aws:dynamodb:ddblocal:000000000000:table/SampleTable",
        "BillingModeSummary": {
            "BillingMode": "PAY_PER_REQUEST",
            "LastUpdateToPayPerRequestDateTime": "2021-08-30T22:49:37.677000+09:00"
        }
    }
}
```

3. 項目のインサート
```sh
% TABLE=SampleTable sh bin/insert-item.sh
```

4. テーブルの確認
```sh
% sh bin/list-tables.sh
{
    "TableNames": [
        "SampleTable"
    ]
}
```

5. 項目の確認
```sh
% TABLE=SampleTable sh bin/scan.sh
{
    "Items": [
        {
            "contactNumber": {
                "S": "080-1234-5678"
            },
            "userName": {
                "S": "山田太郎"
            },
            "userId": {
                "N": "1"
            },
            "age": {
                "N": "29"
            }
        }
    ],
    "Count": 1,
    "ScannedCount": 1,
    "ConsumedCapacity": null
}
```









