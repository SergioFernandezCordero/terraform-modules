variable "environ" {
  description = "Environment to be deployed"
  type        = string
  default     = "local"
}

variable "aws_region" {
  description = "AWS Region to work"
  type        = string
  default     = "eu-north-1"
}

variable "nombre" {
  description = "Stupid variable 1"
  type        = string
  default     = "fulano"
}

variable "lista" {
  description = "Stupid variable 1"
  type        = list(string)
  default     = []
}

variable "set" {
  description = "Stupid variable 1"
  type        = set(string)
  default     = []
}

variable "content" {
  description = "Stupid variable 1"
  type        = string
  default     = "null"
}
