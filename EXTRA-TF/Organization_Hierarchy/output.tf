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

############################################################ Project #####################################################################

output "monitoring_project" {
  value = google_project.monitoring_project.project_id
}

output "med_dev_project" {
  value = google_project.med_dev_project.project_id
}

output "med_test_project" {
  value = google_project.med_test_project.project_id
}

output "infra_linux_qa_project" {
  value = google_project.infra_linux_qa_project.project_id
}

output "edu_dev_project" {
  value = google_project.edu_dev_project.project_id
}

output "edu_test_project" {
  value = google_project.edu_test_project.project_id
}

output "operational_services_project" {
  value = google_project.operational_services_project.project_id
}

output "bus_dev_project" {
  value = google_project.bus_dev_project.project_id
}

output "bus_test_project" {
  value = google_project.bus_test_project.project_id
}

output "infra_linux_qa_project" {
  value = google_project.infra_linux_qa_project.project_id
}

output "datalake_cmn_iac_project" {
  value = google_project.datalake_cmn_iac_project.project_id
}

