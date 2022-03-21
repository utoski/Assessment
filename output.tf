# Public ip address output
output "instance" {
  value = aws_instance.rdp-ssh-instance.public_ip
}