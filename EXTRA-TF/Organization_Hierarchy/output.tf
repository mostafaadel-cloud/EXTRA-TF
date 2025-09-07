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

output "med_pr_project" {
  value = google_project.med_pr_project.project_id
}

output "med_dev_project" {
  value = google_project.med_dev_project.project_id
}

output "med_test_project" {
  value = google_project.med_test_project.project_id
}

output "edu_pr_project" {
  value = google_project.edu_pr_project.project_id
}

output "edu_dev_project" {
  value = google_project.edu_dev_project.project_id
}

output "edu_test_project" {
  value = google_project.edu_test_project.project_id
}

output "bus_pr_project" {
  value = google_project.bus_pr_project.project_id
}

output "bus_dev_project" {
  value = google_project.bus_dev_project.project_id
}

output "bus_test_project" {
  value = google_project.bus_test_project.project_id
}

output "network_project" {
  value = google_project.network_project.project_id
}

output "logging_and_monitoring_project" {
  value = google_project.logging_and_monitoring_project.project_id
}

