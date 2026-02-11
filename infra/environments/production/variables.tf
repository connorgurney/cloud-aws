# Name of environment to deploy to
variable "environment" {
  description = "The name of the environment to deploy to."
  type        = string
}

# Full name of primary contact
variable "primary_contact_name" {
  description = "The name of the primary contact."
  type        = string
}

# Company name of primary contact
variable "primary_contact_company_name" {
  description = "The name of the company to which the primary contact belongs."
  type        = string
}

# First line of address at which primary contact is located
variable "primary_contact_address_line_1" {
  description = "The first line of the address at which the primary contact is located."
  type        = string
}

# Second line of address at which primary contact is located
variable "primary_contact_address_line_2" {
  description = "The second line of the address at which the primary contact is located."
  type        = string
}

# Third line of address at which primary contact is located
variable "primary_contact_address_line_3" {
  description = "The third line of the address at which the primary contact is located."
  type        = string
}

# City of address at which primary contact is located
variable "primary_contact_city" {
  description = "The city of the address at which the primary contact is located."
  type        = string
}

# District or county of address at which primary contact is located
variable "primary_contact_district_or_county" {
  description = "The district or county of the address at which the primary contact is located."
  type        = string
}

# State or region of address at which primary contact is located
variable "primary_contact_state_or_region" {
  description = "The state or region of the address at which the primary contact is located."
  type        = string
}

# Postal code of address at which primary contact is located
variable "primary_contact_postal_code" {
  description = "The postal code of the address at which the primary contact is located."
  type        = string
}

# Country code of address at which primary contact is located
variable "primary_contact_country_code" {
  description = "The country code of the address at which the primary contact is located."
  type        = string
}

# Phone number on which primary contact can be reached
variable "primary_contact_phone_number" {
  description = "The phone number on which the primary contact can be reached."
  type        = string
}

# URL of website for primary contact
variable "primary_contact_website_url" {
  description = "The URL of the website owned or operated by the primary contact."
  type        = string
}

# Name of billing contact
variable "billing_contact_name" {
  description = "The name of the billing contact."
  type        = string
}

# Job title of billing contact
variable "billing_contact_title" {
  description = "The job title of the billing contact."
  type        = string
}

# Phone number on which billing contact can be reached
variable "billing_contact_phone_number" {
  description = "The phone number on which the billing contact can be reached."
  type        = string
}

# Email address on which billing contact can be reached
variable "billing_contact_email_address" {
  description = "The email address on which the billing contact can be reached."
  type        = string
}

# Name of operations contact
variable "operations_contact_name" {
  description = "The name of the operations contact."
  type        = string
}

# Job title of operations contact
variable "operations_contact_title" {
  description = "The job title of the operations contact."
  type        = string
}

# Phone number on which operations contact can be reached
variable "operations_contact_phone_number" {
  description = "The phone number on which the operations contact can be reached."
  type        = string
}

# Email address on which operations contact can be reached
variable "operations_contact_email_address" {
  description = "The email address on which the operations contact can be reached."
  type        = string
}

# Name of security contact
variable "security_contact_name" {
  description = "The name of the security contact."
  type        = string
}

# Job title of security contact
variable "security_contact_title" {
  description = "The job title of the security contact."
  type        = string
}

# Phone number on which security contact can be reached
variable "security_contact_phone_number" {
  description = "The phone number on which the security contact can be reached."
  type        = string
}

# Email address on which security contact can be reached
variable "security_contact_email_address" {
  description = "The email address on which the security contact can be reached."
  type        = string
}
