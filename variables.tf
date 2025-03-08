variable "nombre" {
    type    = string
    default = "fulano"
}

variable "lista" {
    type = list(string)
    default = []
}

variable "set" {
    type = set(string)
    default = []
}

variable "mapa" {
    type = map(any)
    default = {}
}

variable "objecto" {
    type = object({
        precio = number
        nombre = string
        stock = bool
    })
}

variable "mapobjecto" {
    type = map(object({
        precio = number
        nombre = string
        stock = bool
    }))
}