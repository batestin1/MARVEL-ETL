variable "table_name" {
  type    = string
  default = "marveldb"
}

variable "hash_key" {
  type    = string
  default = "id_"
}

variable "id_attr" {
  type    = string
  default = "name"
}

variable "image_attr" {
  type    = string
  default = "image"
}

variable "description_attr" {
  type    = string
  default = "description"
}

variable "read_capacity" {
  type    = number
  default = 1
}

variable "write_capacity" {
  type    = number
  default = 1
}
