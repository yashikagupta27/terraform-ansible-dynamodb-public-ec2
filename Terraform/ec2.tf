resource "aws_security_group" "my_private_sg"{
    name= "private-sg"
    description= "private security group for my vpc"
    vpc_id= module.vpc.vpc_id

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
    description = "SSH_open"
    }


    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" //acess to everything
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access to open outbound"
  }

}
# ec2 instance for private subnet
resource "aws_instance" "my_instance" {
  subnet_id = module.vpc.private_subnets[0]
  associate_public_ip_address = false
  depends_on = [ aws_security_group.my_private_sg]
  key_name        = "my-infra-key"
  vpc_security_group_ids = [aws_security_group.my_private_sg.id]
  instance_type   = var.ec2_instance_type
  ami             = var.ec2_ami_id 

  # root_block_device {
  #   volume_size = var.ec2_root_storage_size
  #   volume_type = "gp3"
  # }
  tags = {
    name = "private_ec2"
  }

} 

resource "aws_security_group" "my_public_sg" {
  name        = "public-sg"
  description = "public security group for my instance"
  vpc_id = module.vpc.vpc_id

  

  # inbound rule/ingress
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH_open"

  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP_open"

  }
  #    outbound rule/egress
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" //acess to everything
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access to open outbound"
  }
}

# ec2 instance for public instance
resource "aws_instance" "my_public_instance" {
   subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  depends_on = [ aws_security_group.my_public_sg]
  key_name        = "my-infra-key"
  vpc_security_group_ids = [aws_security_group.my_public_sg.id]
  instance_type   = var.ec2_instance_type
  ami             = var.ec2_ami_id 

  # root_block_device {
  #   volume_size = var.ec2_root_storage_size
  #   volume_type = "gp3"
  # }
  tags = {
    name = "public_ec2"
  }

} 