# mock_resource1.tftest.hcl
# usage of real provider, fake provider with mock_resource, mock_data


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
  alias = "fake"

  mock_resource "aws_s3_bucket" {
    defaults = {
      arn = "arn:aws:s3:::dummy-bucket-arn-AAA"

      tags = {
        Name        = "dummy-bucket-arn-AAA"
        Environment = "DEV2"
      }
    }
  }

  mock_data "aws_s3_bucket" {
    defaults = {
      arn = "arn:aws:s3:::dummy-bucket-arn-BBB"
    }
  }
}

run "fake_resouce_check" {
  providers = {
    aws = aws.fake
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.arn == "arn:aws:s3:::dummy-bucket-arn-AAA"
    error_message = "incorrect bucket ARN"
  }
}

run "fake_data_lookup_check" {

  providers = {
    aws = aws.fake
  }

  assert {
    condition     = data.aws_s3_bucket.selected.arn == "arn:aws:s3:::dummy-bucket-arn-BBB"
    error_message = "incorrect bucket ARN"
  }
}