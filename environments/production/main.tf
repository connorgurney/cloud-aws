# Terraform configuration
terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "connorgurney-iac-tf"
    key    = "cloud-aws"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


# AWS configuration
provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      "connorgurney-workload"            = "cloud-aws"
      "connorgurney-environment"         = var.environment
      "connorgurney-exposure"            = "internal"
      "connorgurney-data-classification" = "private"
    }
  }
}

# Organisation and accounts
module "organisation" {
  source = "../../modules/organisation"

  environment = var.environment
}

# Contacts
module "contacts" {
  source = "../../modules/contacts"

  primary_name               = var.primary_contact_name
  primary_company_name       = var.primary_contact_company_name
  primary_address_line_1     = var.primary_contact_address_line_1
  primary_address_line_2     = var.primary_contact_address_line_2
  primary_address_line_3     = var.primary_contact_address_line_3
  primary_city               = var.primary_contact_city
  primary_district_or_county = var.primary_contact_district_or_county
  primary_state_or_region    = var.primary_contact_state_or_region
  primary_postal_code        = var.primary_contact_postal_code
  primary_country_code       = var.primary_contact_country_code
  primary_phone_number       = var.primary_contact_phone_number
  primary_website_url        = var.primary_contact_website_url

  billing_name          = var.billing_contact_name
  billing_title         = var.billing_contact_title
  billing_phone_number  = var.billing_contact_phone_number
  billing_email_address = var.billing_contact_email_address

  operations_name          = var.operations_contact_name
  operations_title         = var.operations_contact_title
  operations_phone_number  = var.operations_contact_phone_number
  operations_email_address = var.operations_contact_email_address

  security_name          = var.security_contact_name
  security_title         = var.security_contact_title
  security_phone_number  = var.security_contact_phone_number
  security_email_address = var.security_contact_email_address
}

# Security and identity
module "security" {
  source = "../../modules/security"
}

# Observability
module "observability" {
  source = "../../modules/observability"

  environment = var.environment
}
