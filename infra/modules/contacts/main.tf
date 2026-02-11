# Primary contact
resource "aws_account_primary_contact" "this" {
  full_name    = var.primary_name
  company_name = var.primary_company_name

  address_line_1     = var.primary_address_line_1
  address_line_2     = var.primary_address_line_2
  address_line_3     = var.primary_address_line_3
  city               = var.primary_city
  district_or_county = var.primary_district_or_county
  state_or_region    = var.primary_state_or_region
  postal_code        = var.primary_postal_code
  country_code       = var.primary_country_code
  
  phone_number = var.primary_phone_number
  website_url  = var.primary_website_url
}

# Alternate contact for billing
resource "aws_account_alternate_contact" "billing" {
  alternate_contact_type = "BILLING"

  name = var.billing_name
  title = var.billing_title

  phone_number = var.billing_phone_number
  email_address  = var.billing_email_address
}

# Alternate contact for operations
resource "aws_account_alternate_contact" "operations" {
  alternate_contact_type = "OPERATIONS"

  name = var.operations_name
  title = var.operations_title

  phone_number = var.operations_phone_number
  email_address  = var.operations_email_address
}

# Alternate contact for security
resource "aws_account_alternate_contact" "security" {
  alternate_contact_type = "SECURITY"

  name = var.security_name
  title = var.security_title

  phone_number = var.security_phone_number
  email_address  = var.security_email_address
}
