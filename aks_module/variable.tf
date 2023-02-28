#########################################
# List of Default Variables
#########################################
variable "release_version" {
  type = string
}
variable "global_common_tags" {
  type = map(any)
}
variable "subscription_common_tags" {
  type = map(any)
}
variable "resource_group_common_tags" {
  type = map(any)
}
variable "environment_common_tags" {
  type = map(any)
}
variable "role_common_tags" {
  type = map(any)
}

##################################
# Inputs for the AKS Cluster #
##################################                                                                 

variable "name_prefix" {
  description = "Optional prefix for names"
  type        = string
  default     = ""
}

variable "custom_aks_name" {
  description = "Optional custom name"
  type        = string
  default     = null
}


variable "resource_group_name" {
  type = string 
}

variable "location" {
  type = string
}

variable "node_pool" {
  type = string 
  default = "default"
}

variable "node_count" {
  type = number
  default = 1
}

variable "vm_size" {
    type = string 
    default = "Standard_D2_v2"
}

variable "environment" {
  description = "Project Env"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "tags" {
  description = "Tags shared by all resources of this module. Will be merged with any other specific tags by resource."
  default     = {}
}