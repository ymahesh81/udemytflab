output "arn" {
  description = "ARN of S3 bucket"
  value = aws_s3_bucket.staticweb.arn
}

output "endpoint" {
  description = "S3 bucket endpoint"
  value = aws_s3_bucket.staticweb.website_endpoint
}

output "bucketname" {
  description = "s3 bucket name"
  value = aws_s3_bucket.staticweb.id
}