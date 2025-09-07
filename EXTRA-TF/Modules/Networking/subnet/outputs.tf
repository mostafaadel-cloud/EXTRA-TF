output "ex_infra_linux_qa_subnet_id" {
  value = google_compute_subnetwork.ex_infra_linux_qa_subnet.id
}

output "ex_infra_linux_prd_subnet_id" {
  value = google_compute_subnetwork.ex_infra_linux_prd_subnet.id
}

output "ex_infra_linux_dr_subnet_id" {
  value = google_compute_subnetwork.ex_infra_linux_dr_subnet.id
}

output "ex_infra_linux_tsr_subnet_id" {
  value = google_compute_subnetwork.ex_infra_linux_tsr_subnet.id
}


output "ex_operational_services_subnet_id" {
  value = google_compute_subnetwork.ex_operational_services_subnet.id
}


output "ex_datalake_cmn_iac_subnet_id" {
  value = google_compute_subnetwork.ex_datalake_cmn_iac_subnet.id
}


output "ex_datalake_prod_prod_subnet_id" {
  value = google_compute_subnetwork.ex_datalake_prod_prod_subnet.id
}
