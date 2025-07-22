# Generate an SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/builder_key.pem"
  file_permission = "0600"
}

# Create an AWS key pair using the public key
resource "aws_key_pair" "builder_key" {
  key_name   = "tal_builder_key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}