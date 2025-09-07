#===============================================================================================================================
#===============================================================================================================================
# LOG Bucket

resource "google_logging_project_bucket_config" "logging" {
    project    = var.monitoring_project
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

  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "monitoring_project" {
  name   = "monitoring-project-sink"
  description = "Monitoring Project Sink"
  project = var.monitoring_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "network_project" {
  name   = "network-project-sink"
  description = "Network Project Sink"
  project = var.network_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "operational_services_project" {
  name   = "operational-services-project-sink"
  description = "Operational Services Project Sink"
  project = var.operational_services_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "infra_linux_qa_project" {
  name   = "infra-linux-qa-project-sink"
  description = "Infra Linux QA Project Sink"
  project = var.infra_linux_qa_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "infra_linux_prd_project" {
  name   = "infra-linux-prd-project-sink"
  description = "Infra Linux PRD Project Sink"
  project = var.infra_linux_prd_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "infra_linux_dr_project" {
  name   = "infra-linux-dr-project-sink"
  description = "Infra Linux DR Project Sink"
  project = var.infra_linux_dr_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

resource "google_logging_project_sink" "infra_linux_tsr_project" {
  name   = "infra-linux-tsr-project-sink"
  description = "Infra Linux TSR Project Sink"
  project = var.infra_linux_tsr_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "datalake_cmn_iac_project" {
  name   = "datalake-cmn-iac-project-sink"
  description = "Datalake CMN IAC Project Sink"
  project = var.datalake_cmn_iac_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}

#===============================================================================================================================
#===============================================================================================================================

resource "google_logging_project_sink" "datalake_prod_prod_project" {
  name   = "datalake-prod-prod-project-sink"
  description = "Datalake Prod PROD Project Sink"
  project = var.datalake_prod_prod_project
  destination = "logging.googleapis.com/projects/${var.monitoring_project}/locations/${var.location}/buckets/${google_logging_project_bucket_config.logging.bucket_id}"
}


#===============================================================================================================================
#===============================================================================================================================
# Permissions

resource "google_project_iam_binding" "log_Writer" {
  project = var.monitoring_project
  role = "roles/logging.logWriter"

  members = [
    google_logging_organization_sink.org_sink.writer_identity,
    
    google_logging_project_sink.monitoring_project.writer_identity,
    google_logging_project_sink.network_project.writer_identity,
    google_logging_project_sink.operational_services_project.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
    google_logging_project_sink.infra_linux_prd_project.writer_identity,
    google_logging_project_sink.infra_linux_dr_project.writer_identity,
    google_logging_project_sink.infra_linux_tsr_project.writer_identity,
    google_logging_project_sink.datalake_cmn_iac_project.writer_identity,
    google_logging_project_sink.datalake_prod_prod_project.writer_identity
  ]
}

resource "google_project_iam_binding" "bucket_Writer" {
  project = var.monitoring_project
  role = "roles/logging.bucketWriter"

  members = [
    google_logging_organization_sink.org_sink.writer_identity,
    
    google_logging_project_sink.monitoring_project.writer_identity,
    google_logging_project_sink.network_project.writer_identity,
    google_logging_project_sink.operational_services_project.writer_identity,
    google_logging_project_sink.infra_linux_qa_project.writer_identity,
    google_logging_project_sink.infra_linux_prd_project.writer_identity,
    google_logging_project_sink.infra_linux_dr_project.writer_identity,
    google_logging_project_sink.infra_linux_tsr_project.writer_identity,
    google_logging_project_sink.datalake_cmn_iac_project.writer_identity,
    google_logging_project_sink.datalake_prod_prod_project.writer_identity
  ]
}


#===============================================================================================================================
#===============================================================================================================================

# Metrics Scope 
locals {
  metric_scopes = {
    network      = var.infra_linux_qa_project
    # monitoring_project   = var.monitoring_project
    network_project   = var.network_project
    operational_services_project   = var.operational_services_project
    infra_linux_qa_project   = var.infra_linux_qa_project
    infra_linux_prd_project   = var.infra_linux_prd_project
    infra_linux_tsr_project   = var.infra_linux_tsr_project
    operational_services_project   = var.operational_services_project
    datalake_prod_prod_project   = var.datalake_prod_prod_project
  }
}

resource "google_monitoring_monitored_project" "projects_metric_scopes" {
  for_each      = local.metric_scopes
  metrics_scope = "locations/global/metricsScopes/${var.monitoring_project}"
  name          = "locations/global/metricsScopes/${var.monitoring_project}/projects/${each.value}"
}

