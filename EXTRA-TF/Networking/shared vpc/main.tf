##########################################################################################################################################
############################################################ Shared VPC ##################################################################
##########################################################################################################################################
resource "google_compute_shared_vpc_host_project" "host_project" {
  project = var.network_project
}

resource "google_compute_shared_vpc_service_project" "edu_prod_project" {
  host_project    = google_compute_shared_vpc_host_project.host_project.project
  service_project = var.network_project
}

