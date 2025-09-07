variable "runner_sa" {
  description = "Email of the service account that runs Terraform/Cloud Build."
  type        = string
}

variable "application_projects" {
  description = "Projects where APIs are enabled and sinks are created."
  type        = set(string)
}

variable "scoping_project" {
  description = "The Monitoring metrics-scope (host) project ID."
  type        = string
}


variable "host_project_id" {
  default = "extra-networking-project"
}

variable "service_project_id" {
  default = "extra-edu-pr-project"
}

variable "service_project_number" {
  default = "306250913508"
}