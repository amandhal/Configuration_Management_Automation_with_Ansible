# RedHat EC2 Public IPs
output "redhat_ec2_public_ips" {
  value = aws_instance.ec2_redhat[*].public_ip
}

# Ubuntu EC2 Public IPs
output "ubuntu_ec2_public_ips" {
  value = aws_instance.ec2_ubuntu[*].public_ip
}