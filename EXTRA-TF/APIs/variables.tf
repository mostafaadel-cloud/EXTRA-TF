variable "infra_linux_qa_project" {
  description = "infra_linux_qa_project"
  type = string
}


variable "datalake_cmn_iac_project" {
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
