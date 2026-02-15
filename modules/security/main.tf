# Password policy
# The requirements outlined here are from my documentation site at
# https://docs.internal.connorgurney.me.uk/knowledge/authentication-and-authorisation.html#password-policy.
resource "aws_iam_account_password_policy" "this" {
  minimum_password_length = 15

  require_lowercase_characters = true
  require_uppercase_characters = true
  require_numbers              = true
  require_symbols              = false
}
