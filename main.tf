data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "rg-arc-dash" {
  name     = "rg-arc-dash"
  location = "UK South"
}

resource "azurerm_portal_dashboard" "arc-dash" {
  name                = "Azure-Arc-Dashboard"
  resource_group_name = azurerm_resource_group.rg-arc-dash.name
  location            = azurerm_resource_group.rg-arc-dash.location
  tags = {
    hidden-title = "Azure Arc Dashboard"
  }
  dashboard_properties = templatefile("dash.tpl",
    {
      sub_id     = data.azurerm_subscription.current.subscription_id
  })
}