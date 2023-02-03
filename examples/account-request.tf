# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
module "sandbox_account_01" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "rostskadat+aws+<project>@gmail.com"
    AccountName  = "project"
    # Syntax for top-level OU
    # ManagedOrganizationalUnit = "Sandbox"
    # Syntax for nested OU
    ManagedOrganizationalUnit = "Sandbox (ou-07lw-8w95pkn0)"
    SSOUserEmail     = "noreply@example.com"
    SSOUserFirstName = "John"
    SSOUserLastName  = "Doe"
  }

  account_tags = {
    "environment" = "development" # Values: development|production
  }

  change_management_parameters = {
    change_requested_by = "John Doe"
    change_reason       = "Testing the account vending process"
  }

  custom_fields = {
    # These will be translated to SSM parameters
    environment   = "production"
    workload_name = "audit"
    account_type  = "infra" # Values: "infra|sandbox|workload"
  }

  account_customizations_name = "sandbox-customizations"
}
