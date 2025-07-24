resource "aws_instance" "builder" {
    ami                    = data.aws_ami.ubuntu.id
    instance_type          = "t3.medium"
    subnet_id              = data.aws_subnets.target_vpc_subnets.ids[0]
    key_name               = aws_key_pair.builder_key.key_name
    vpc_security_group_ids = [aws_security_group.builder_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "builder"
        Owner = "tal"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo apt update -y",
        "sudo apt install -y docker.io",
        "sudo systemctl enable docker",
        "sudo systemctl start docker",
        "sudo usermod -aG docker ubuntu" #maybe need to log out and in of the user
        ]
    }
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/builder_key.pem")
    host        = self.public_ip
    }
}