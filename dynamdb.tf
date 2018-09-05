/*resource aws_dynamodb_table "tfstate_dynamodb_table"{
    name = "Test03TFLockDynamoDB"
    read_capacity = 20
    write_capacity = 20
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}*/
