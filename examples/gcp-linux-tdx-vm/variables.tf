variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
default = 551221341017
}
#required for Intel Confidential Compute VM with TDX
variable "enable_confidential_compute" {
  description = "Enable confidential computing"
  type        = bool
  default     = true
}

variable "confidential_instance_type" {
  description = "Type of confidential instance"
  type        = string
  default     = "TDX"
}
