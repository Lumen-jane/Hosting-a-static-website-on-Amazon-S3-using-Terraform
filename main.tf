resource "random_id" "bucket_suffix" {
  byte_length = 7
}
 # I used random-id to add a random variable to my bucketname so as to make it unique

resource "aws_s3_bucket" "directors_buckets" {
  bucket = "${var.bucketname}-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "chizzy_bucket"
    Environment = "Dev"
  }
}


# to get ownership control over my bucket 
resource "aws_s3_bucket_ownership_controls" "sample" {
  bucket = aws_s3_bucket.directors_buckets.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


# to make my bucket public
resource "aws_s3_bucket_public_access_block" "sample" {
  bucket = aws_s3_bucket.directors_buckets.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# to give a read only access to my bucket
resource "aws_s3_bucket_acl" "sample" {
  depends_on = [
    aws_s3_bucket_ownership_controls.sample,
    aws_s3_bucket_public_access_block.sample,
  ]

  bucket = aws_s3_bucket.directors_buckets.id
  acl    = "public-read"
}


 # Adding files (object) to my bucket
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.directors_buckets.id
    key    = "index.html"
    source = "index.html"
    acl    = "public-read"
    content_type = "text/html"
}


resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.directors_buckets.id
    key    = "error.html"
    source = "error.html"
    acl    = "public-read"
    content_type = "text/html"
}

# to configure my bucket as a website 
resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.directors_buckets.id
    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }

    depends_on = [ aws_s3_bucket_acl.sample ]
  
}


