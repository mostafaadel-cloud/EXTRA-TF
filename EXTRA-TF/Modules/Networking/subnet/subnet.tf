

resource "google_compute_subnetwork" "ex_infra_linux_qa_subnet" {
  name                       = "ex-infra-linux-qa-subnet"
  project                    = var.network_project
  network                    = var.ex_infra_linux_qa_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.0.0/19"
}


resource "google_compute_subnetwork" "ex_infra_linux_prd_subnet" {
  name                       = "ex-infra-linux-prd-subnet"
  project                    = var.network_project
  network                    = var.ex_infra_linux_prd_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.32.0/19"
}


resource "google_compute_subnetwork" "ex_infra_linux_dr_subnet" {
  name                       = "ex-infra-linux-dr-subnet"
  project                    = var.network_project
  network                    = var.ex_infra_linux_dr_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.64.0/19"
}


resource "google_compute_subnetwork" "ex_infra_linux_tsr_subnet" {
  name                       = "ex-infra-linux-tsr-subnet"
  project                    = var.network_project
  network                    = var.ex_infra_linux_tsr_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.96.0/19"
}


resource "google_compute_subnetwork" "ex_operational_services_subnet" {
  name                       = "ex-operational-services-subnet"
  project                    = var.network_project
  network                    = var.ex_operational_services_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.128.0/19"
}

resource "google_compute_subnetwork" "ex_datalake_cmn_iac_subnet" {
  name                       = "ex-datalake-cmn-iac-subnet"
  project                    = var.network_project
  network                    = var.ex_datalake_cmn_iac_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.160.0/19"
}

resource "google_compute_subnetwork" "ex_datalake_prod_prod_subnet" {
  name                       = "ex-datalake-prod-prod-subnet"
  project                    = var.network_project
  network                    = var.ex_datalake_prod_prod_vpc_id
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose                    = "PRIVATE"
  region                     = var.dammam_region
  stack_type                 = "IPV4_ONLY"
  ip_cidr_range              = "172.31.192.0/19"
}
