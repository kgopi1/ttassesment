resource "azurerm_key_vault" "vmkey"{

}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azurerm_key_vault_secret" "vmsecret" {
    value = random_password.password.result
  
}



resource "azurerm_vitural_machine" "vm1" {
    admin_user = var.admin_user
    admin_password = azurerm_key_vault_secret.vmsecret.value
}