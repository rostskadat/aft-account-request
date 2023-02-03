# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

module "workloadtest-dev" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "rostskadat+aws+workloadtest-dev@gmail.com"
    AccountName               = "workloadtest-dev"
    ManagedOrganizationalUnit = "Workloads (ou-coor-3bcxcgyc)"
    SSOUserEmail              = "noreply@example.com"
    SSOUserFirstName          = "Default User"
    SSOUserLastName           = "Control Tower"
  }

  account_tags = {
    "environment"        = "dev"
  }

  custom_fields = {
    environment          = "dev"
    vpc_size             = "small"
    workload_name        = "workloadtest"
    account_type         = "workload" # Values: "infra|sandbox|workload"
  }

  change_management_parameters = {
    change_requested_by = "rostskadat"
    change_reason       = "Test workload account"
  }

  account_customizations_name = "workloads"
}
