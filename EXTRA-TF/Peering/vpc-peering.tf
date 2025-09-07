resource "google_compute_network_peering" "extra_business_vpc_to_hybrid" {
  name                                = "extra-business-vpc-to-hybrid"
  network                             = var.extra-business-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_business_vpc" {
  name                                = "from-hybrid-to-extra-business-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-business-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}
resource "google_compute_network_peering" "extra_health_vpc_to_hybrid" {
  name                                = "extra-health-vpc-to-hybrid"
  network                             = var.extra-health-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_health_vpc" {
  name                                = "from-hybrid-to-extra-health-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-health-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}
resource "google_compute_network_peering" "extra_education_vpc_to_hybrid" {
  name                                = "extra-education-vpc-to-hybrid"
  network                             = var.extra-education-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_education_vpc" {
  name                                = "from-hybrid-to-extra-education-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-education-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}
resource "google_compute_network_peering" "extra_trusted_hub_vpc_to_hybrid" {
  name                                = "extra-trusted-hub-vpc-to-hybrid"
  network                             = var.extra-trusted-hub-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_trusted_hub_vpc" {
  name                                = "from-hybrid-to-extra-trusted-hub-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-trusted-hub-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}
resource "google_compute_network_peering" "extra_untrusted_hub_vpc_to_hybrid" {
  name                                = "extra-untrusted-hub-vpc-to-hybrid"
  network                             = var.extra-untrusted-hub-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_untrusted_hub_vpc" {
  name                                = "from-hybrid-to-extra-untrusted-hub-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-untrusted-hub-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}
resource "google_compute_network_peering" "extra_managment_vpc_to_hybrid" {
  name                                = "extra-managment-vpc-to-hybrid"
  network                             = var.extra-managment-vpc
  peer_network                        = var.hybrid-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}

resource "google_compute_network_peering" "from_hybrid_to_extra_managment_vpc" {
  name                                = "from-hybrid-to-extra-managment-vpc"
  network                             = var.hybrid-vpc
  peer_network                        = var.extra-managment-vpc
  export_subnet_routes_with_public_ip = false
  import_custom_routes                = true
  export_custom_routes                = true
}