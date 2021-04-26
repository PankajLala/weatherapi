provider "azurerm" {
  version = "2.5.0"
  features {}
  subscription_id = "7eed3e9c-10ee-4527-abae-10d2f7a7cc27"
}

resource "azurerm_resource_group" "tf_test" {
  name     = "tfmainrg"
  location = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name

  ip_address_type = "public"
  dns_name_label  = "panka01l"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "panka01l/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 5000
      protocol = "TCP"

    }

  }
}
