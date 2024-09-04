variable "environment" {
  type = string
  default = "sbx"
}

variable "department" {
  type = string
  default = "999"
}

variable "environment_class" {
    type = string
    default = "sbx"
}

variable "user_tags" {
    type = list(string)
    default = []
    nullable = true
}

variable "location" {
    type = string
    default = "us-west1"
}

variable "team" {
    type = string
    default = "mcp"
}

variable "cluster_short_name" {
    type = string
    default = "sbx"
}

locals {
  gcp_zones = {
      us-west1 = "usw1"
      us-central1 = "usc1"
  }

  tags = distinct(concat(var.user_tags, [var.environment_class, var.zone])
}

locals {
  cluster_full_name = format(
    "gcp-gke-%s-%s-%s-%s-%s", 
    var.environment_class,
    local.gcp_zones[var.location],
    var.department,
    var.team,
    var.cluster_short_name
    )
  }
