variable "project_id" {
  description = "The project ID to create VPCs in"
  type        = string
}

variable "vpc_configs" {
  description = "List of VPCs and subnets"
  type = list(object({
    name        = string
    subnet_name = string
    cidr_range  = string
    region      = string
  }))
}