##########################################################################################################################################
############################################################ Shared VPC ##################################################################
##########################################################################################################################################
resource "google_compute_shared_vpc_host_project" "host_project" {
  project = var.infra_linux_qa_project
}

resource "google_compute_shared_vpc_service_project" "edu_prod_project" {
  host_project    = google_compute_shared_vpc_host_project.host_project.project
  service_project = var.infra_linux_qa_project
}

