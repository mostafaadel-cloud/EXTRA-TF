terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

#===============================================================================================================================
#===============================================================================================================================
# @@
#fill all the locals below
locals {
  org_id = "563436578313"
  region = "me-central2"
  zone   = "me-central2-a"
}

#===============================================================================================================================
#===============================================================================================================================

provider "google" {
  region = local.region
  zone   = local.zone

}

#===============================================================================================================================
#===============================================================================================================================
# @@ Create bucket from console
terraform {
  backend "gcs" {
    bucket = "extra-tf-state"
    prefix = "terraform/state"
  }
}

#===============================================================================================================================
#===============================================================================================================================

module "Org_Hierarcy" {
  source          = "./Organization_Hierarchy"
  org_id          = local.org_id
  billing_account = var.billing_account
}

#===============================================================================================================================
#===============================================================================================================================

module "VPCs" {
  source      = "./Networking/VPCs"
  project_id  = module.Org_Hierarcy.network_project
  vpc_configs = var.vpc_configs
}

#===============================================================================================================================
#===============================================================================================================================
# @@ Change app projects
module "APIs" {
  source                         = "./APIs"
  network_project                = module.Org_Hierarcy.network_project
  logging_and_monitoring_project = module.Org_Hierarcy.logging_and_monitoring_project

  application_projects = toset([
    module.Org_Hierarcy.monitoring_project,
    module.Org_Hierarcy.med_dev_project,
    module.Org_Hierarcy.med_test_project,
    module.Org_Hierarcy.network_project,
    module.Org_Hierarcy.edu_dev_project,
    module.Org_Hierarcy.edu_test_project,
    module.Org_Hierarcy.operational_services_project,
    module.Org_Hierarcy.bus_dev_project,
    module.Org_Hierarcy.bus_test_project,
  ])

  depends_on = [module.Org_Hierarcy]
}

#===============================================================================================================================
#===============================================================================================================================
# @@ Change app projects
module "Centralized_Logging" {
  source                         = "./Centralized_Logging"
  org_id                         = local.org_id
  logging_and_monitoring_project = module.Org_Hierarcy.logging_and_monitoring_project
  location                       = local.region
  network_project                = module.Org_Hierarcy.network_project
  monitoring_project                 = module.Org_Hierarcy.monitoring_project
  med_dev_project                = module.Org_Hierarcy.med_dev_project
  med_test_project               = module.Org_Hierarcy.med_test_project
  network_project                 = module.Org_Hierarcy.network_project
  edu_dev_project                = module.Org_Hierarcy.edu_dev_project
  edu_test_project               = module.Org_Hierarcy.edu_test_project
  operational_services_project                 = module.Org_Hierarcy.operational_services_project
  bus_dev_project                = module.Org_Hierarcy.bus_dev_project
  bus_test_project               = module.Org_Hierarcy.bus_test_project
  depends_on                     = [module.VPCs, module.APIs]
}

#===============================================================================================================================
#===============================================================================================================================
# @@ Change app projects and service account
module "iam_runner" {
  source    = "./IAM"
  runner_sa = "971573762455-compute@developer.gserviceaccount.com"
  application_projects = toset([
    module.Org_Hierarcy.monitoring_project,
    module.Org_Hierarcy.med_dev_project,
    module.Org_Hierarcy.med_test_project,
    module.Org_Hierarcy.network_project,
    module.Org_Hierarcy.edu_dev_project,
    module.Org_Hierarcy.edu_test_project,
    module.Org_Hierarcy.operational_services_project,
    module.Org_Hierarcy.bus_dev_project,
    module.Org_Hierarcy.bus_test_project,
    module.Org_Hierarcy.network_project,
  ])
  scoping_project = module.Org_Hierarcy.logging_and_monitoring_project
}

#===============================================================================================================================
#===============================================================================================================================

module "Shared_VPC" {
  source          = "./Networking/shared vpc"
  network_project = module.Org_Hierarcy.network_project
  network_project  = module.Org_Hierarcy.network_project
  depends_on      = [module.APIs]
}

#===============================================================================================================================
#===============================================================================================================================
# @@ Change VPCs
module "firewalls" {
  source          = "./Networking/firewalls"
  network_project = module.Org_Hierarcy.network_project
  hybrid-vpc                    = "extra-hybrid-connectivity-vpc"
  extra-business-vpc             = "extra-business-vpc"
  extra-health-vpc               = "extra-health-vpc"
  extra-education-vpc            = "extra-education-vpc"
  extra-trusted-hub-vpc          = "extra-trusted-hub-vpc"
  extra-managment-vpc            = "extra-managment-vpc"
  extra-untrusted-hub-vpc        = "extra-untrusted-hub-vpc"
}

#===============================================================================================================================
#===============================================================================================================================
# @@ Revise peering requirement
# VPC Peering Module
module "vpc-peering" {
  source                        = "./Networking/vpc-peering"
  hybrid-vpc                    = "extra-hybrid-connectivity-vpc"
  extra-business-vpc             = "extra-business-vpc"
  extra-health-vpc               = "extra-health-vpc"
  extra-education-vpc            = "extra-education-vpc"
  extra-trusted-hub-vpc          = "extra-trusted-hub-vpc"
  extra-managment-vpc            = "extra-managment-vpc"
}

#===============================================================================================================================
#===============================================================================================================================