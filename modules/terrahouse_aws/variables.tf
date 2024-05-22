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

variable "index_html_filepath" {
  type        = string
  description = "The path to the index.html file"

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The index_html_filepath variable must point to an existing file"
  }
}

variable "error_html_filepath" {
  type        = string
  description = "The path to the error.html file"

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The error_html_filepath variable must point to an existing file"
  }
}

variable "content_version" {
  type        = number
  description = "The content version. Should be a positive integer starting at 1."

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version variable must be a positive integer starting at 1"
  }

}
