locals {

  config = yamldecode(file("${path.module}/config.yaml"))

  # base config
  project              = local.config.project
  resource_index       = try(local.config.resource_index, var.resource_index)
  environment          = try(local.config.environment, var.environment)
  region               = try(local.config.region, var.region)
  location             = try(local.config.location, var.location)
  service_principal_id = local.config.service_principal_id
  aad_group_object_id  = local.config.aad_group_object_id
  tags                 = try(local.config.tags, var.tags)

}

module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [
    local.project,
    local.environment,
    local.region,
    local.resource_index,
  ]
}

resource "azurerm_resource_group" "main" {
  location = local.location
  name     = module.naming.resource_group.name
  tags     = local.tags
}
