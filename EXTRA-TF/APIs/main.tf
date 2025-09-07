locals {
  network_project_APIs = ["cloudresourcemanager.googleapis.com","servicenetworking.googleapis.com", "compute.googleapis.com", "iam.googleapis.com", "logging.googleapis.com"]
     
  monitoring_project_APIs = ["cloudresourcemanager.googleapis.com","iam.googleapis.com", "logging.googleapis.com","monitoring.googleapis.com"]

}

 resource "google_project_service" "network_project" {
  project            = var.network_project
  for_each           = toset(local.network_project_APIs)
  service            = each.key
  disable_on_destroy = false
}

 resource "google_project_service" "monitoring_project" {
  project            = var.monitoring_project
  for_each           = toset(local.monitoring_project_APIs)
  service            = each.key
  disable_on_destroy = false
}


#===============================================================================================================================
#===============================================================================================================================
# Enable APIs in each application project where sinks/metrics-scope will be created

resource "google_project_service" "app_logging_api" {
  for_each           = var.application_projects
  project            = each.value
  service            = "logging.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "app_monitoring_api" {
  for_each           = var.application_projects
  project            = each.value
  service            = "monitoring.googleapis.com"
  disable_on_destroy = false
}
#===============================================================================================================================
#===============================================================================================================================