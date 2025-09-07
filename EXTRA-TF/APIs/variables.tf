variable "network_project" {
  description = "network_project"
  type = string
}


variable "logging_and_monitoring_project" {
  description = "logging_project"
  type = string
}

#===============================================================================================================================
#===============================================================================================================================

variable "application_projects" {
  description = "Projects that will host app workloads and require Logging/Monitoring APIs."
  type        = set(string)
  default     = []
}
