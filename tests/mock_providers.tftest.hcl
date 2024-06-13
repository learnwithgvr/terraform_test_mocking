# mock_providers.tftest.hcl
# provider mocking

variables {
  bucket_name = "my-fake-bucket-name"
}

provider "aws" {
}

mock_provider "aws" {
  alias = "fake"
}

run "sets_real_name" {
  command = plan

  // providers = {
  //   aws = aws
  // }

  // variables {
  //   bucket_name = "my-real-bucket-name"
  // }

  assert {
    condition     = aws_s3_bucket.my_bucket.bucket == var.bucket_name
    error_message = "incorrect bucket name"
  }
}

run "sets_fake_name" {
  
  providers = {
    aws = aws.fake
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.bucket == "my-fake-bucket-name"
    error_message = "incorrect bucket name"
  }
}