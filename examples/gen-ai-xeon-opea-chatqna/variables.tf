variable "project" {
  type        = string
  default     = "551221341017"
  description = "Enter GCP Project ID"
}

# Variable for Huggingface Token
variable "huggingface_token" {
  description = "Enter a Huggingface Token to be used to download the models"
  default     = "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"
  type        = string
}