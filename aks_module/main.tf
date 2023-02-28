provider "azurerm" {
    features {}
}

locals {
  name_prefix  = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : "aks"
  default_name = lower("${local.name_prefix}-${var.client_name}-${var.environment}")

  aks_cluster_name = coalesce(var.custom_aks_name, "${local.default_name}-cluster")

  common_tags = merge(
    var.global_common_tags,
    var.subscription_common_tags,
    var.resource_group_common_tags,
    var.environment_common_tags,
    var.role_common_tags,
  )
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = local.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  default_node_pool {
    name       = var.node_pool
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    local.common_tags, 
    var.tags, 
    {
        "environment" = var.environment, 
        "capability" = var.client_name, 
        "Terraform" = true, 
    }
  )
}
