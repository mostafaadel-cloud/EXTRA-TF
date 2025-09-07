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
  display_name = "EX-Monitoring"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "terraform_folder" {
  display_name = "EX-TERRAFORM"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "infrastructure_folder" {
  display_name = "EX-Infrastructure"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "network_folder" {
  display_name = "EX-Network"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "operational_services_folder" {
  display_name = "Ex-Operational-Services"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "cyber_folder" {
  display_name = "EX-Cyber"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "datalake_folder" {
  display_name = "EX-DataLake"
  parent       = "organizations/${var.org_id}"
}
# EX-MONTORING-Montoring
########################################## Projects under Monitoring Folder ########################################################################

resource "google_project" "monitoring_project" {
  name            = "EX-MONTORING-Montoring"
  project_id      = "ex-montoring-montoring"
  folder_id       = google_folder.monitoring_folder.id
  billing_account = var.billing_account
}
# EX-Network-NW
#################################### Projects under Network Folder ########################################################################

resource "google_project" "network_project" {
  name       = "EX-Network-NW"
  project_id = "ex-network-nw"
  folder_id  = google_folder.terraform_folder.id
  billing_account = var.billing_account
}
# Ex-Operational-Services
#################################### Projects under Operational Services Folder ########################################################################

resource "google_project" "operational_services_project" {
  name       = "Ex-Operational-Services"
  project_id = "ex-operational-services"
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
      
