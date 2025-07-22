resource "aws_instance" "builder" {
    ami                    = data.aws_ami.ubuntu.id
    instance_type          = "t3.medium"
    subnet_id              = data.aws_subnets.target_vpc_subnets.ids[0]
    key_name               = aws_key_pair.builder_key.key_name
    vpc_security_group_ids = [aws_security_group.builder_sg.id]
    tags = {
        Owner = "tal"
    }
}