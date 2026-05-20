variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = set(string)
  default = ["10.0.0.1/16"]
}
