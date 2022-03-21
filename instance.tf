resource "aws_instance" "rdp-ssh-instance" {
  ami           = var.AMI  # microsoft windows server 2019 base
  instance_type = var.instance-size
  tags          = {
    Name        = "rdp-ssh-instance"
  }

  # the VPC subnet
  subnet_id = aws_subnet.subnet-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh-rdp.id]

  # the public SSH key
  key_name = aws_key_pair.testi-keypair.key_name

  }

  # The EBS volume

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-2a"
  size              = var.ebs-size
  type              = "gp2"
  tags = {
    Name = "extra volume data"
    delete_on_termination = "true"  
  }
}

resource "aws_volume_attachment" "ebs-volume-first-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.rdp-ssh-instance.id
}
