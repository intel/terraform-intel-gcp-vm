variable "project" {
  type        = string
  description = "Enter GCP Project ID"
}

# Variable for Huggingface Token
variable "huggingface_token" {
  description = "Enter a Huggingface Token to be used to download the models"
  default     = " <YOUR HUGGINGFACE TOKEN> "
  type        = string
}