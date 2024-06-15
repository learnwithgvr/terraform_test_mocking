# mock_resource2.tftest.hcl
# usage of real provider, fake provider with tfmock.hcl file

provider "aws" {}

run "use_real_provider" {
  command = plan
  
  providers = {
    aws = aws
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.bucket == var.bucket_name
    error_message = "incorrect bucket ARN"
  }
}

mock_provider "aws" {
  source = "./test_template/aws"
  alias = "fake"
}

run "fake_resouce_check" {
  providers = {
    aws = aws.fake
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.arn == "arn:aws:s3:::dummy-bucket-arn-ABC"
    error_message = "incorrect bucket ARN"
  }
}

run "fake_data_lookup_check" {

  providers = {
    aws = aws.fake
  }

  assert {
    condition     = data.aws_s3_bucket.selected.arn == "arn:aws:s3:::dummy-bucket-arn-PQR"
    error_message = "incorrect bucket ARN"
  }
}