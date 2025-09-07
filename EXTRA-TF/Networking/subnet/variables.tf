variable "dammam_region" {
  default = "me-central2"
}

variable "network_project" {
  type = string
}

variable "ex_infra_linux_qa_vpc_id" {
  type = string
  description = "anb VPN VPC"
}

variable "ex_infra_linux_prd_vpc_id" {
  type = string
  description = "anb Data Analytics Project"
}

variable "ex_infra_linux_dr_vpc_id" {
  type = string
  description = "anb UAT NON DMZ VPC"
}

variable "ex_infra_linux_tsr_vpc_id" {
  type = string
  description = "anb UAT NON DMZ Host Project"
}

variable "ex_operational_services_vpc_id" {
  type = string
  description = "anb Data Analytics Project"
}

variable "ex_datalake_cmn_iac_vpc_id" {
  type = string
  description = "anb Data Analytics Project"
}

variable "ex_datalake_prod_prod_vpc_id" {
  type = string
  description = "anb Data Analytics Project"
}

