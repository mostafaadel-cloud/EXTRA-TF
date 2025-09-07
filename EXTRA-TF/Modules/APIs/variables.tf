variable "network_project" {
  description = "Network Project"
  type = string
}


variable "monitoring_project" {
  description = "Monitoring Project"
  type = string
}

#===============================================================================================================================
#===============================================================================================================================

variable "application_projects" {
  description = "Projects that will host app workloads and require Logging/Monitoring APIs."
  type        = set(string)
  default     = []
}
