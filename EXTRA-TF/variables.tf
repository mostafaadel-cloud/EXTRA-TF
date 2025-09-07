variable "billing_account" {
  type    = string
  default = "01837F-3A88AD-FD8B48"
}

#===============================================================================================================================
#===============================================================================================================================

variable "vpc_configs" {
  description = "List of VPCs and their subnet configurations"
  type = list(object({
    name        = string
    subnet_name = string
    cidr_range  = string
    region      = string
  }))
  default = [
    {
      name        = "extra-business-vpc"
      subnet_name = "extra-business-subnet"
      cidr_range  = "172.26.20.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-health-vpc"
      subnet_name = "extra-health-subnet"
      cidr_range  = "172.26.21.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-education-vpc"
      subnet_name = "extra-education-subnet"
      cidr_range  = "172.26.22.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-trusted-hub-vpc"
      subnet_name = "extra-trusted-hub-subnet"
      cidr_range  = "172.26.10.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-untrusted-hub-vpc"
      subnet_name = "extra-untrusted-hub-subnet"
      cidr_range  = "172.26.11.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-managment-vpc"
      subnet_name = "extra-managment-subnet"
      cidr_range  = "172.26.12.0/24"
      region      = "me-central2"
    },
    {
      name        = "extra-hybrid-connectivity-vpc"
      subnet_name = "extra-hybrid-connectivity-subnet"
      cidr_range  = "172.26.13.0/24"
      region      = "me-central2"
    }
  ]
}

#===============================================================================================================================
#===============================================================================================================================

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

