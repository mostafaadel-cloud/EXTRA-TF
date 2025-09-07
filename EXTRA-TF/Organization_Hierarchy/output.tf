############################################################ Folders #####################################################################
output "monitoring_folder" {
  value = google_folder.monitoring_folder.id
}

output "terraform_folder" {
  value = google_folder.terraform_folder.id
}

output "infrastructure_folder" {
  value = google_folder.infrastructure_folder.id
}

output "network_folder" {
  value = google_folder.network_folder.id
}

output "operational_services_folder" {
  value = google_folder.operational_services_folder.id
}

output "cyber_folder" {
  value = google_folder.cyber_folder.id
}

output "datalake_folder" {
  value = google_folder.datalake_folder.id
}

############################################################ Sub-Folders #####################################################################

output "infra_linux_subfolder" {
  value = google_folder.infra_linux_subfolder.id
}

output "infra_windows_subfolder" {
  value = google_folder.infra_windows_subfolder.id
}

output "datalake_cmn_subfolder" {
  value = google_folder.datalake_cmn_subfolder.id
}

output "datalink_prod_subfolder" {
  value = google_folder.datalink_prod_subfolder.id
}

############################################################ Project #####################################################################

output "monitoring_project" {
  value = google_project.monitoring_project.project_id
}

output "network_project" {
  value = google_project.network_project.project_id
}

output "operational_services_project" {
  value = google_project.operational_services_project.project_id
}

output "infra_linux_qa_project" {
  value = google_project.infra_linux_qa_project.project_id
}

output "infra_linux_prd_project" {
  value = google_project.infra_linux_prd_project.project_id
}

output "infra_linux_dr_project" {
  value = google_project.infra_linux_dr_project.project_id
}

output "infra_linux_tsr_project" {
  value = google_project.infra_linux_tsr_project.project_id
}

output "datalake_cmn_iac_project" {
  value = google_project.datalake_cmn_iac_project.project_id
}


output "datalake_prod_prod_project" {
  value = google_project.datalake_prod_prod_project.project_id
}
