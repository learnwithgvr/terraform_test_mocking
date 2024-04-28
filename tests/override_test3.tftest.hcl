# placing override resources, override data in root
# placing override resources, override data in run blocks
# here underlying provider doesn't matter

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

run "override_resouce_check" {

  override_resource {
    target = aws_s3_bucket.my_bucket

    values = {
      bucket = "overriden_bucket55"
      arn = "arn:aws:s3:::overriden_bucket55"
    }
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.arn == "arn:aws:s3:::overriden_bucket55"
    error_message = "incorrect bucket ARN"
  }
}

run "override_data_lookup_check" {

  override_data {
    target = data.aws_s3_bucket.selected

    values = {
      bucket = "overriden_bucket66"
      arn = "arn:aws:s3:::overriden_bucket66"
    }
  }

  assert {
    condition     = data.aws_s3_bucket.selected.arn == "arn:aws:s3:::overriden_bucket66"
    error_message = "incorrect bucket ARN"
  }
}