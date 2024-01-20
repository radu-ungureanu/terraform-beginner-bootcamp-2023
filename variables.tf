variable "user_uuid" {
  type        = string
  description = "the UUID of the user"

  validation {
    condition     = can(regex("^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$", var.user_uuid))
    error_message = "The user_uuid variable must be a valid UUID"
  }
}
