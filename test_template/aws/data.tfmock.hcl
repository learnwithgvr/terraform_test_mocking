# ./test_template/aws/data.tfmock.hcl

mock_resource "aws_s3_bucket" {
  defaults = {
    arn = "arn:aws:s3:::dummy-bucket-arn-ABC"
  }
}

mock_data "aws_s3_bucket" {
  defaults = {
    arn = "arn:aws:s3:::dummy-bucket-arn-PQR"
  }
}