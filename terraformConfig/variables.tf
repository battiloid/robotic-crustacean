variable aws_region {
  default     = "us-east-2"
  type        = "string"
  description = "The region used to push this Terraform Configuration too"
}

variable aws_azs {
  type = "map"

  default = {
    zone1 = "us-east-2a"
    zone2 = "us-east-2b"
    zone3 = "us-east-2c"
  }
}

variable aws_vpc_name {
  default     = "TF generated VPC"
  type        = "string"
  description = "The name of the top level VPC"
}

variable aws_vpc_ip_cidr_range {
  default     = "14.42.0.0/16"
  type        = "string"
  description = "IP CIDR Range for AWS VPC."
}

variable subnet_names {
  type = "map"

  default = {
    subnetP1 = "TF Test Private Subnet AZ-1"
    subnetP2 = "TF Test Private Subnet AZ-2"
    subnetP3 = "TF Test Private Subnet AZ-3"
    subnetX1 = "TF Test Public Subnet AZ-1"
    subnetX2 = "TF Test Public Subnet AZ-2"
    subnetX3 = "TF Test Public Subnet AZ-3"
  }
}

variable instance_names {
  type = "map"

  default = {
    configInstance1 = "TF Test Instance for Config Server in AZ-1"
    configInstance2 = "TF Test Instance for Config Server in AZ-2"
    configInstance3 = "TF Test Instance for Config Server in AZ-3"

    discoveryInstance1 = "TF Test Instance for Discovery Server in AZ-1"
    discoveryInstance2 = "TF Test Instance for Discovery Server in AZ-2"
    discoveryInstance3 = "TF Test Instance for Discovery Server in AZ-3"
  }
}
