output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.terrahouse_aws.bucket_name
}

output "website_endpoint" {
  description = "The endpoint for our static website"
  value       = module.terrahouse_aws.website_endpoint
}

output "cloudfront_url" {
  description = "The CloudFront URL for our static website"
  value       = module.terrahouse_aws.cloudfront_url

}
