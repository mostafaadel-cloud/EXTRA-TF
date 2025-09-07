# Let the runner enable/disable APIs in all application projects

resource "google_project_iam_member" "runner_serviceusage_admin" {
  for_each = var.application_projects
  project  = each.value
  role     = "roles/serviceusage.serviceUsageAdmin"
  member   = "serviceAccount:${var.runner_sa}"
}

# Let the runner manage metrics-scope memberships on the scoping project

resource "google_project_iam_member" "runner_metrics_scopes_admin" {
  project = var.scoping_project
  role    = "roles/monitoring.metricsScopesAdmin"
  member  = "serviceAccount:${var.runner_sa}"
}

# (Recommended) Allow the runner to create/update logging sinks in source projects
# logging_project_sink requires Logs Configuration Writer on the source project.

resource "google_project_iam_member" "runner_logging_config_writer" {
  for_each = var.application_projects
  project  = each.value
  role     = "roles/logging.configWriter"
  member   = "serviceAccount:${var.runner_sa}"
}

# 3. Grant roles/compute.networkUser to the service project service accounts

resource "google_project_iam_member" "cloud_services_sa" {
  project = var.host_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${var.service_project_number}@cloudservices.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_system_sa" {
  project = var.host_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:service-${var.service_project_number}@compute-system.iam.gserviceaccount.com"
}


