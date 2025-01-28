resource "aws_s3_bucket" "infra_site_bucket" {
  bucket = "${var.appName}-${var.productName}-${var.environment}"
}

resource "aws_s3_bucket_versioning" "infra_site_bucket_versioning" {
  bucket = aws_s3_bucket.infra_site_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.infra_site_bucket
  ]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "infra_site_bucket_encryption" {
  bucket = aws_s3_bucket.infra_site_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [
    aws_s3_bucket.infra_site_bucket
  ]
}

resource "aws_s3_bucket_website_configuration" "infra_site_bucket_website" {
  bucket = aws_s3_bucket.infra_site_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [
    aws_s3_bucket.infra_site_bucket
  ]
}
