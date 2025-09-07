output "vpc_names" {
  value = [for v in google_compute_network.vpc : v.name]
}

output "subnet_names" {
  value = [for s in google_compute_subnetwork.subnet : s.name]
}