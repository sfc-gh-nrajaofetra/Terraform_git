terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "nrajaofetra"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "nra_terraform_git_db" {
  name    = "NRA_TERRAFORM_GIT_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "tf_demo_schema" {
  database = snowflake_database.nra_terraform_git_db.name
  name     = "TF_DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}