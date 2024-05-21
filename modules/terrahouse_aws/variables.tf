variable "user_uuid" {
  type        = string
  description = "the UUID of the user"

  validation {
    condition     = can(regex("^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$", var.user_uuid))
    error_message = "The user_uuid variable must be a valid UUID"
  }
}

variable "bucket_name" {
  type        = string
  description = "the name of the bucket"

  validation {
    condition = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9]+$", var.bucket_name))
    )
    error_message = "The bucket_name variable must be between 3 and 63 characters long and can only contain lowercase letters and numbers"
  }
}
