resource "azurerm_resource_group" "aks_acr_dev_rc_group" {
  name     = "${var.prefix}${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_container_registry" "acr-instance" {
  name                = "${var.prefix}containerregistry"
  resource_group_name = "${azurerm_resource_group.aks_acr_dev_rc_group.name}"
  location            = "${azurerm_resource_group.aks_acr_dev_rc_group.location}"
  admin_enabled       = true
  sku                 = "${var.acr_sku_name}"
}

resource "azurerm_route_table" "aks_route_table" {
  name                = "${var.prefix}routetable"
  location            = "${azurerm_resource_group.aks_acr_dev_rc_group.location}"
  resource_group_name = "${azurerm_resource_group.aks_acr_dev_rc_group.name}"

  route {
    name                   = "default"
    address_prefix         = "10.100.0.0/14"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }
}

resource "azurerm_virtual_network" "aks_vpc" {
  name                = "${var.prefix}network"
  location            = "${azurerm_resource_group.aks_acr_dev_rc_group.location}"
  resource_group_name = "${azurerm_resource_group.aks_acr_dev_rc_group.name}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.aks_acr_dev_rc_group.name}"
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = "${azurerm_virtual_network.aks_vpc.name}"

  # this field is deprecated and will be removed in 2.0 _ but is required until then
  route_table_id = "${azurerm_route_table.aks_route_table.id}"
}

resource "azurerm_subnet_route_table_association" "aks_subnet_route_table" {
  subnet_id      = "${azurerm_subnet.aks_subnet.id}"
  route_table_id = "${azurerm_route_table.aks_route_table.id}"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.prefix}k8s"
  location            = "${azurerm_resource_group.aks_acr_dev_rc_group.location}"
  resource_group_name = "${azurerm_resource_group.aks_acr_dev_rc_group.name}"
  dns_prefix          = "${var.prefix}k8s"
  kubernetes_version  = "${var.kube_version}"

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = "${var.agent_count}"
    vm_size         = "${var.azurek8s_sku}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.aks_os_disk_size}"
    # Required for advanced networking
    vnet_subnet_id  = "${azurerm_subnet.aks_subnet.id}"
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  network_profile {
    network_plugin = "azure"
  }

  role_based_access_control {
    enabled = true

    azure_active_directory {
      # NOTE: in a Production environment these should be different values
      # but for the purposes of this example, this should be sufficient
      client_app_id     = "${var.kubernetes_client_id}"

      server_app_id     = "${var.kubernetes_client_id}"
      server_app_secret = "${var.kubernetes_client_secret}"
    }
  }

  tags = {
    Environment = "${var.env_tag}"
  }
}