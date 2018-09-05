/*resource aws_s3_bucket "TFStateFiles"{
  bucket="awstest03-tf-states"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm="AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy=true
  }
}*/