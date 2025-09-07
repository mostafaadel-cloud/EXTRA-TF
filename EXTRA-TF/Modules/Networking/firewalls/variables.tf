variable "dammam_region" {
  type        = string
  default = "me-central2"
}

#===============================================================================================================================
#===============================================================================================================================

variable "infra_linux_qa_project" {
  type        = string
}

#===============================================================================================================================
#===============================================================================================================================

variable "hybrid-vpc" {
  type        = string
  description = ""
}

variable "extra-business-vpc"{
  type = string
  description = ""
}

variable "extra-health-vpc"{
  type = string
  description = ""
}

variable "extra-education-vpc"{
  type = string
  description = ""
}

variable "extra-trusted-hub-vpc"{
  type = string
  description = ""
}

variable "extra-untrusted-hub-vpc"{
  type = string
  description = ""
}

variable "extra-managment-vpc"{
  type = string
  description = ""
}

#===============================================================================================================================
#===============================================================================================================================
