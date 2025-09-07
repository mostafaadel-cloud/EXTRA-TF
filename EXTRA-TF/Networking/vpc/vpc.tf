

resource "google_compute_network" "ex_infra_linux_qa_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-infra-linux-qa-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}


resource "google_compute_network" "ex_infra_linux_prd_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-infra-linux-prd-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}

resource "google_compute_network" "ex_infra_linux_dr_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-infra-linux-dr-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}

resource "google_compute_network" "ex_infra_linux_tsr_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-infra-linux-tsr-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}


resource "google_compute_network" "ex_operational_services_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-operational-services-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}

resource "google_compute_network" "ex_datalake_cmn_iac_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-datalake-cmn-iac-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}

resource "google_compute_network" "ex_datalake_prod_prod_vpc" {
  auto_create_subnetworks  = false
  name                     = "ex-datalake-prod-prod-vpc"
  project                  = var.network_project
  routing_mode             = "REGIONAL"
  enable_ula_internal_ipv6 = false
}
