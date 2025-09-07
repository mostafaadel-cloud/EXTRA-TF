#===============================================================================================================================
#===============================================================================================================================
# LOG Bucket

resource "google_logging_project_bucket_config" "logging" {
    project    = var.logging_and_monitoring_project
    location  = var.location
    retention_days = 90
    bucket_id = "centralized-logging"
}

#===============================================================================================================================
#===============================================================================================================================
# LOG Sinks 

resource "google_logging_organization_sink" "org_sink" {
  name   = "org-sink"
  description = "Organization Sink"
  org_id = var.org_id

  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "infra_linux_qa_project" {
  name   = "network-project-sink"
  description = "network project Sink"
  project = var.infra_linux_qa_project

  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"

}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "monitoring_project" {
  name   = "med-pr-project-sink"
  description = "med-pr-project-sink"
  project = var.monitoring_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "med_dev_project" {
  name   = "med-dev-project-sink"
  description = "med-dev-project-sink"
  project = var.med_dev_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "med_test_project" {
  name   = "med-test-project-sink"
  description = "med-test-project-sink"
  project = var.med_test_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "infra_linux_qa_project" {
  name   = "edu-pr-project-sink"
  description = "edu-pr-project-sink"
  project = var.infra_linux_qa_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "edu_dev_project" {
  name   = "edu-dev-project-sink"
  description = "edu-dev-project-sink"
  project = var.edu_dev_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "edu_test_project" {
  name   = "edu-test-project-sink"
  description = "edu-test-project-sink"
  project = var.edu_test_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "operational_services_project" {
  name   = "bus-pr-project-sink"
  description = "bus-pr-project-sink"
  project = var.operational_services_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}


resource "google_logging_project_sink" "bus_dev_project" {
  name   = "bus-dev-project-sink"
  description = "bus-dev-project-sink"
  project = var.bus_dev_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "bus_test_project" {
  name   = "bus-test-project-sink"
  description = "bus-test-project-sink"
  project = var.bus_test_project
  destination = "logging.googleapis.com/projects/${var.logging_and_monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}


#===============================================================================================================================
#===============================================================================================================================
# Permissions

resource "google_project_iam_binding" "log_Writer" {
  project = var.logging_and_monitoring_project
  role = "roles/logging.logWriter"

  members = [
    google_logging_organization_sink.org_sink.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
    google_logging_project_sink.monitoring_project.writer_identity,
    google_logging_project_sink.med_dev_project.writer_identity,
    google_logging_project_sink.med_test_project.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
    google_logging_project_sink.edu_dev_project.writer_identity,
    google_logging_project_sink.edu_test_project.writer_identity,
    google_logging_project_sink.operational_services_project.writer_identity,
    google_logging_project_sink.bus_dev_project.writer_identity,
    google_logging_project_sink.bus_test_project.writer_identity,
  ]
}

resource "google_project_iam_binding" "bucket_Writer" {
  project = var.logging_and_monitoring_project
  role = "roles/logging.bucketWriter"

  members = [
    google_logging_organization_sink.org_sink.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
     google_logging_project_sink.monitoring_project.writer_identity,
    google_logging_project_sink.med_dev_project.writer_identity,
    google_logging_project_sink.med_test_project.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
    google_logging_project_sink.edu_dev_project.writer_identity,
    google_logging_project_sink.edu_test_project.writer_identity,
    google_logging_project_sink.operational_services_project.writer_identity,
    google_logging_project_sink.bus_dev_project.writer_identity,
    google_logging_project_sink.bus_test_project.writer_identity,
  ]
}


#===============================================================================================================================
#===============================================================================================================================

# Metrics Scope 
locals {
  metric_scopes = {
    network      = var.infra_linux_qa_project
    # monitoring_project   = var.monitoring_project
    med_dev_project   = var.med_dev_project
    med_test_project   = var.med_test_project
    infra_linux_qa_project   = var.infra_linux_qa_project
    edu_dev_project   = var.edu_dev_project
    edu_test_project   = var.edu_test_project
    operational_services_project   = var.operational_services_project
    bus_dev_project   = var.bus_dev_project
    bus_test_project   = var.bus_test_project
  }
}

resource "google_monitoring_monitored_project" "projects_metric_scopes" {
  for_each      = local.metric_scopes
  metrics_scope = "locations/global/metricsScopes/${var.logging_and_monitoring_project}"
  name          = "locations/global/metricsScopes/${var.logging_and_monitoring_project}/projects/${each.value}"
}

