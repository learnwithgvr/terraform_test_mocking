# override_test2.tftest.hcl
# placing override resources, override data in root
# here underlying provider doesn't matter

override_resource {
  target = aws_s3_bucket.my_bucket

  values = {
    bucket = "overriden_bucket1"
    arn = "arn:aws:s3:::overriden_bucket1111"
  }
}

override_data {
  target = data.aws_s3_bucket.selected

  values = {
    bucket = "overriden_bucket2"
    arn = "arn:aws:s3:::overriden_bucket2222"
  }
}

run "override_resouce_check" {
  assert {
    condition     = aws_s3_bucket.my_bucket.arn == "arn:aws:s3:::overriden_bucket1111"
    error_message = "incorrect bucket ARN"
  }
}

run "override_data_lookup_check" {
  assert {
    condition     = data.aws_s3_bucket.selected.arn == "arn:aws:s3:::overriden_bucket2222"
    error_message = "incorrect bucket ARN"
  }
}