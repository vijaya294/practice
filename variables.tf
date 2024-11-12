# mandatory user should supply
variable "ami_id" {
    type = string
   # default = "ami-09c813fb71547fc4f"
}

# optional, default value is t3.micro and user can always aoerride
# only use t3.micro, t3,small, t3.medium
variable "instance_type" {
    default = "t3.micro"
    validation {
        condition       = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
        error_message   = "instance_type should only be t3.micro, t3.small, t3.medium"
    }
}

# mandatory user should supply 
variable "sg_id" {
    type = list(string)
}