variable aws_region {
  default     = "us-east-2"
  type        = "string"
  description = "The region used to push this Terraform Configuration too"
}

variable vpc_name {
  type    = "string"
  default = "Primary VPC"
}

variable vpc_cidr {
  type    = "string"
  default = "14.42.0.0/16"
}

variable public_sub_cidr {
  description = "a list of CIDRs for external subnets the VPC"
  type        = "list"
  default     = ["14.42.0.0/19", "14.42.64.0/19", "14.42.128.0/19"]
}

variable private_sub_cidr {
  description = "a list of CIDRs for internal subnets the VPC"
  type        = "list"
  default     = ["14.42.32.0/20", "14.42.96.0/20", "14.42.160.0/20"]
}

variable name {
  description = "Name for resources"
  default     = "robotic_crustacean"
}

variable tags {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable vpc_id {
  description = "VPC ID to override, must be entered if \"create_vpc\" is false."
  default     = ""
}

variable create {
  description = "Create Module, defaults to true."
  default     = true
}

variable create_vpc {
  description = "Determines whether a VPC should be created or if a VPC ID will be passed in."
  default     = true
}

variable "data_instance_size" {
  default = "t2.micro"
}

variable "nat_count" {
  default = 1
}

##
## Bastion Configurations
##

variable "bastion_image_id" {
  default = ""
}

variable "bastion_servers_count" {
  default = 1
}

variable "bastion_ssh_key_name" {
  default = "lb-rc-key"
}
