# placing override_resources, override_data in mock_provider

mock_provider "aws" {
  alias = "fake"

  override_resource {
    target = aws_s3_bucket.my_bucket

    values = {
      bucket = "overriden_bucket1"
      arn = "arn:aws:s3:::overriden_bucket1"
    }
  }
  override_data {
    target = data.aws_s3_bucket.selected

    values = {
      bucket = "overriden_bucket2"
      arn = "arn:aws:s3:::overriden_bucket2"
    }
  }
}

run "override_resouce_check" {
  providers = {
    aws = aws.fake
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.arn == "arn:aws:s3:::overriden_bucket1"
    error_message = "incorrect bucket ARN"
  }
}

run "override_data_lookup_check" {

  providers = {
    aws = aws.fake
  }

  assert {
    condition     = data.aws_s3_bucket.selected.arn == "arn:aws:s3:::overriden_bucket2"
    error_message = "incorrect bucket ARN"
  }
}