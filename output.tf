output "website_url" {
  value = aws_s3_bucket.directors_buckets.bucket_domain_name
}
