locals {
  infra_linux_qa_project_APIs = ["cloudresourcemanager.googleapis.com","servicenetworking.googleapis.com", "compute.googleapis.com", "iam.googleapis.com", "logging.googleapis.com"]
     
  logging_project_APIs = ["cloudresourcemanager.googleapis.com","iam.googleapis.com", "logging.googleapis.com","monitoring.googleapis.com"]

}

 resource "google_project_service" "infra_linux_qa_project_APIs" {
  project            = var.infra_linux_qa_project
  for_each           = toset(local.infra_linux_qa_project_APIs)
  service            = each.key
  disable_on_destroy = false
}

 resource "google_project_service" "logging_project_APIs" {
  project            = var.logging_and_monitoring_project
  for_each           = toset(local.logging_project_APIs)
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