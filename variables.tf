variable "cidr_block" {
    description = "cidr block"
    type = string
    default = ""  
}

variable "public_subnets" {
    description = "public subnet"
    type = list
    default = []
}
