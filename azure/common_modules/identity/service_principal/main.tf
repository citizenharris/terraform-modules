data "azuread_group" "default_group" {
  display_name     = var.owner_ad_group
  security_enabled = true
}
resource "azuread_service_principal" "service_principal" {
  application_id               = var.application_id
  app_role_assignment_required = var.app_role_assignment_required
  tags                         = var.tags
  # you cannot set a group as the owner of an application, 
  # see https://feedback.azure.com/forums/169401-azure-active-directory/suggestions/6688284-ad-groups-in-application-owners
  # so add all the members of the group as owners
  # this has the disadvantage that as team members change we will need to update the owners of the apps
  owners = data.azuread_group.default_group.members
}
