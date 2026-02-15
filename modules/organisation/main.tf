# Organization itself
resource "aws_organizations_organization" "this" {
  feature_set = "ALL"

  aws_service_access_principals = [
    "account.amazonaws.com",
    "security-ir.amazonaws.com"
  ]
}

# Root account
resource "aws_organizations_account" "root" {
  count = var.environment == "production" ? 1 : 0 

  # Whilst making these details public feels somewhat of a risk, it'd be trivial
  # to work out through a mixture of common sense and an enumeration attack, as
  # the name is relatively obvious and the email address is on my website.
  #
  # I also have a strong baseline for the security of my root account, which you
  # can read about on my documentation site at
  # https://docs.internal.connorgurney.me.uk/knowledge/aws.html.

  name  = "connorgurney-root"
  email = "digital@connorgurney.me.uk"
}
