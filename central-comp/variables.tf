variable "region" {
  description = "Resource region"
  default     = "weeu"
}

variable "location" {
  description = "Resource location"
  default     = "West Europe"
}

variable "environment" {
  description = "Environment to deploy to (nonprd/preprd/prd)"
  type        = string
  default     = "nonprd"
}

variable "resource_index" {
  description = "Resource index (01, 02, etc.)"
  type        = string
  default     = "01"
}

variable "tags" {
  description = "Tags we want to set per solution zone"
  type        = map(string)
  default = {
    "Project Name" : "Mad Framework Central Component default tag"
    "Type" : "Mad Framework default tags"
  }
}