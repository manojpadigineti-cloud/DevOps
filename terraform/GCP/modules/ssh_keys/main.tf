resource "tls_private_key" "tls_keys" {
  algorithm = "RSA"
  rsa_bits = 2048
}