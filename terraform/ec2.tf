# SSH key pair 
resource "aws_key_pair" "key_pair" {
  key_name   = "id_rsa"
  public_key = file("/home/ec2-user/.ssh/id_rsa.pub")
}

# RedHat EC2 instances
resource "aws_instance" "ec2_redhat" {
  count                = length(var.availability_zones)
  ami                  = "ami-016eb5d644c333ccb"
  subnet_id            = aws_default_subnet.public_subnets[count.index].id
  instance_type        = "t3.medium"
  iam_instance_profile = "LabInstanceProfile"
  key_name             = aws_key_pair.key_pair.key_name
  security_groups      = [aws_security_group.sg.id]
  tags = {
    Name = "redhat_${count.index + 1}"
    distribution = "redhat"
  }
}

# Ubuntu EC2 instances
resource "aws_instance" "ec2_ubuntu" {
  count                = length(var.availability_zones)
  ami                  = "ami-007855ac798b5175e"
  subnet_id            = aws_default_subnet.public_subnets[count.index].id
  instance_type        = "t3.medium"
  iam_instance_profile = "LabInstanceProfile"
  key_name             = aws_key_pair.key_pair.key_name
  security_groups      = [aws_security_group.sg.id]
  tags = {
    Name = "ubuntu_${count.index + 1}"
    distribution = "ubuntu"
  }
}