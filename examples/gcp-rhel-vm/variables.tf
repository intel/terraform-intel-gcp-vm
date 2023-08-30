variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
  default     = "intel-csa-resource-GCP"
}

# variable "gcp_credentials" {
#   type        = string
#   description = "token"
#   sensitive   = true
# }