# Folders
# EX-Monitoring
# EX-TERRAFORM
# EX-Infrastructure
# EX-Network
# Ex-Operational-Services
# EX-Cyber
# EX-DataLake


#################################################### FOLDERS #################################################################
resource "google_folder" "monitoring_folder" {
  display_name = "EX-Monitoring-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "terraform_folder" {
  display_name = "EX-TERRAFORM-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "infrastructure_folder" {
  display_name = "EX-Infrastructure-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "network_folder" {
  display_name = "EX-Network-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "operational_services_folder" {
  display_name = "Ex-Operational-Services-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "cyber_folder" {
  display_name = "EX-Cyber-Folder"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "datalake_folder" {
  display_name = "EX-DataLake-Folder"
  parent       = "organizations/${var.org_id}"
}

########################################## Projects under Health Folder ########################################################################

resource "google_project" "med_pr_project" {
  name            = "extra-MED-PR-Project"
  project_id      = "extra-med-pr-project"
  folder_id       = google_folder.monitoring_folder.id
  billing_account = var.billing_account
}

resource "google_project" "med_dev_project" {
  name            = "extra-MED-Dev-Project"
  project_id      = "extra-med-dev-project"
  folder_id       = google_folder.monitoring_folder.id
  billing_account = var.billing_account
}

resource "google_project" "med_test_project" {
  name       = "extra-MED-Test-Project"
  project_id = "extra-med-test-project"
  folder_id  = google_folder.monitoring_folder.id
  billing_account = var.billing_account
}

#################################### Projects under Education Folder ########################################################################

resource "google_project" "edu_pr_project" {
  name       = "extra-EDU-PR-Project"
  project_id = "extra-edu-pr-project"
  folder_id  = google_folder.terraform_folder.id
  billing_account = var.billing_account
}

resource "google_project" "edu_dev_project" {
  name       = "extra-EDU-Dev-Project"
  project_id = "extra-edu-dev-project"
  folder_id  = google_folder.terraform_folder.id
  billing_account = var.billing_account
}

resource "google_project" "edu_test_project" {
  name       = "extra-EDU-Test-Project"
  project_id = "extra-edu-test-project"
  folder_id  = google_folder.terraform_folder.id
  billing_account = var.billing_account
}

#################################### Projects under Business Folder ########################################################################

resource "google_project" "bus_pr_project" {
  name       = "extra-BUS-PR-Project"
  project_id = "extra-bus-pr-project"
  folder_id  = google_folder.infrastructure_folder.id
  billing_account = var.billing_account
}

resource "google_project" "bus_dev_project" {
  name       = "extra-BUS-Dev-Project"
  project_id = "extra-bus-dev-project"
  folder_id  = google_folder.infrastructure_folder.id
  billing_account = var.billing_account
}

resource "google_project" "bus_test_project" {
  name       = "extra-BUS-Test-Project"
  project_id = "extra-bus-test-project"
  folder_id  = google_folder.infrastructure_folder.id
  billing_account = var.billing_account
}

#################################### Network Project ########################################################################

resource "google_project" "network_project" {
  name       = "extra-Networking-Project"
  project_id = "extra-networking-project"
  folder_id  = google_folder.network_folder.id
  billing_account = var.billing_account
}

#################################### Logging Project ########################################################################

resource "google_project" "logging_and_monitoring_project" {
  name       = "extra-Log-Mon-project"
  project_id = "extra-log-mon-project"
  folder_id  = google_folder.operational_services_folder.id
  billing_account = var.billing_account
}
      
