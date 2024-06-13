# main.tf

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "DEV"
  }
}

data "aws_s3_bucket" "selected" {
  bucket = "testbucketbygvr"
}
#-------------------------------------------
output "create_bucket" {
  value = aws_s3_bucket.my_bucket.arn
}

output "data_buket" {
  value = data.aws_s3_bucket.selected.arn
}
