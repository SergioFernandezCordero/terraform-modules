variable "environ" {
    type    = string
    default = "local"
}

variable "nombre" {
    type    = string
    default = "fulano"
}

variable "lista" {
    type    = list(string)
    default = []
}

variable "set" {
    type    = set(string)
    default = []
}

variable "content" {
    type    = string
    default = "null"
}
