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
# @@ Check subfolder syntax from official docs
#################################################### SUB-FOLDERS #################################################################

resource "google_folder" "infra_linux_subfolder" {
  display_name = "EX-INFRA-Linux"
  parent       = google_folder.infrastructure_folder.id
}

resource "google_folder" "infra_windows_subfolder" {
  display_name = "EX-INFRA-Windows"
  parent       = google_folder.infrastructure_folder.id
}

resource "google_folder" "datalake_cmn_subfolder" {
  display_name = "EX-Datalake-CMN"
  parent       = google_folder.datalake_folder.id
}

resource "google_folder" "datalink_prod_subfolder" {
  display_name = "EX-Datalake-Prod"
  parent       = google_folder.datalake_folder.id
}

########################################## Projects under Monitoring Folder ########################################################################

resource "google_project" "monitoring_project" {
  name            = "EX-MONTORING-Montoring"
  project_id      = "ex-montoring-montoring"
  folder_id       = google_folder.monitoring_folder.id
  billing_account = var.billing_account
}

#################################### Projects under Network Folder ########################################################################

resource "google_project" "infra_linux_qa_project" {
  name       = "EX-Network-NW"
  project_id = "ex-network-nw"
  folder_id  = google_folder.network_folder.id
  billing_account = var.billing_account
}

#################################### Projects under Operational Services Folder ########################################################################

resource "google_project" "operational_services_project" {
  name       = "Ex-Operational-Services"
  project_id = "ex-operational-services"
  folder_id  = google_folder.operational_services_folder.id
  billing_account = var.billing_account
}

#################################### Projects under INFRA Linux Subfolder ########################################################################

resource "google_project" "infra_linux_qa_project" {
  name       = "EX-INFRA-LINUX-QA"
  project_id = "ex-infra-linux-qa"
  folder_id  = google_folder.infra_linux_subfolder.id
  billing_account = var.billing_account
}

# Add missing References
resource "google_project" "infra_linux_prd_project" {
  name       = "EX-INFRA-LINUX-PRD"
  project_id = "ex-infra-linux-prd"
  folder_id  = google_folder.infra_linux_subfolder.id
  billing_account = var.billing_account
}

# Add missing References
resource "google_project" "infra_linux_dr_project" {
  name       = "EX-INFRA-LINUX-DR"
  project_id = "ex-infra-linux-dr"
  folder_id  = google_folder.infra_linux_subfolder.id
  billing_account = var.billing_account
}

# Add missing References
resource "google_project" "infra_linux_tsr_project" {
  name       = "EX-INFRA-LINUX-TSR"
  project_id = "ex-infra-linux-tsr"
  folder_id  = google_folder.infra_linux_subfolder.id
  billing_account = var.billing_account
}

#################################### Logging Project ########################################################################

resource "google_project" "logging_and_monitoring_project" {
  name       = "extra-Log-Mon-project"
  project_id = "extra-log-mon-project"
  folder_id  = google_folder.operational_services_folder.id
  billing_account = var.billing_account
}
      
resource "google_folder" "parent_folder" {
  display_name = "ParentFolder"
  parent       = "organizations/your_organization_id" # Replace with your organization ID
}

resource "google_folder" "child_folder" {
  display_name = "ChildFolder"
  parent       = google_folder.parent_folder.id # References the ID of the newly created parent folder
}