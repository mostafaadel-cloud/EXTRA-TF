
resource "google_compute_firewall" "allow_ssh_and_hhtp_https_for_rackware" {
  name        = "allow-access-rackware"
  network     = "extra-education-vpc"
  project     = var.network_project
  priority    = 1000
  direction   = "INGRESS"
  source_tags = ["rackware"]
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]

  }
  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_firewall" "allow_peers_to_hybrid" {
  name    = "allow-peers-to-hybrid"
  network = var.hybrid-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: peers subnets
  source_ranges = [
    "172.26.20.0/24",
    "172.26.21.0/24",
    "172.26.22.0/24",
    "172.26.10.0/24",
    "172.26.11.0/24",
    "172.26.12.0/24"
    ]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_business" {
  name    = "allow-hybrid-to-business"
  network = var.extra-business-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: business subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_health" {
  name    = "allow-hybrid-to-health"
  network = var.extra-health-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: health subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_education" {
  name    = "allow-hybrid-to-education"
  network = var.extra-education-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: education subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_trusted_hub" {
  name    = "allow-hybrid-to-trusted-hub"
  network = var.extra-trusted-hub-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: trusted-hub subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_untrusted_hub" {
  name    = "allow-hybrid-to-untrusted-hub"
  network = var.extra-untrusted-hub-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: untrusted-hub subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_hybrid_to_managment" {
  name    = "allow-hybrid-to-managment"
  network = var.extra-managment-vpc

  project = var.network_project

  direction = "INGRESS"
  priority  = 1000

  # Source: managment subnets
  source_ranges = ["172.26.13.0/24"]

  # Allow all protocols/ports
  allow {
    protocol = "all"
  }
}


# locals {
#   vpc_cidrs = {
#     "extra-business-vpc"    = "172.26.20.0/24"
#     "extra-health-vpc"      = "172.26.21.0/24"
#     "extra-education-vpc"   = "172.26.22.0/24"
#     "extra-trusted-hub-vpc" = "172.26.10.0/24"
#     "extra-untrusted-hub-vpc" = "172.26.11.0/24"
#     "extra-managment-vpc"   = "172.26.12.0/24"
#   }
# }


# Allow each peer VPC to reach Hybrid
# resource "google_compute_firewall" "to_hybrid" {
#   for_each = toset(local.vpc_cidrs)

#   name    = "allow-${each.key}-to-hybrid"
#   network = var.hybrid-vpc

#   project = var.network_project

#   direction = "INGRESS"
#   priority  = 1000

#   source_ranges = [each.value] # Subnet CIDR

#   allow {
#     protocol = "all"
#   }
# }

# Allow Hybrid to peers
# resource "google_compute_firewall" "from_hybrid" {
#   for_each = toset(local.vpc_cidrs)

#   name    = "allow-hybrid-to-${each.key}"
#   network = each.key

#   project = var.network_project

#   direction = "INGRESS"
#   priority  = 1000

#   source_ranges = ["172.26.13.0/24"] # Hybrid subnet
#   allow {
#     protocol = "all"
#   }
# }