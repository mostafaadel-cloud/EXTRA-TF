resource "google_compute_network" "vpc" {
  for_each                = { for v in var.vpc_configs : v.name => v }
  name                    = each.value.name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each        = { for v in var.vpc_configs : v.subnet_name => v }
  name            = each.value.subnet_name
  ip_cidr_range   = each.value.cidr_range
  region          = each.value.region
  network         = google_compute_network.vpc[each.value.name].self_link
  project         = var.project_id
}
