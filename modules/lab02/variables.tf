variable "rg_name" {
    type = string
    description = "Resource Group Name"
}
variable "location" {
    type = string
    default = "westus"
}

variable "naming_prefix"  {
    type = string
    default = "lab"
}