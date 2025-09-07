############################################################ Folders #####################################################################
output "health_folder" {
  value = google_folder.health_folder.id
}

output "education_folder" {
  value = google_folder.education_folder.id
}

output "business_folder" {
  value = google_folder.business_folder.id
}

output "networking_folder" {
  value = google_folder.networking_folder.id
}

output "logging_folder" {
  value = google_folder.logging_folder.id
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

