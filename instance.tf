resource "aws_instance" "instance1" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG.id]
  subnet_id              = aws_subnet.subnet1.id
  user_data              = base64encode(file("userdata.sh"))

  tags = {
    Name = "VM1"
  }

}

resource "aws_instance" "instance2" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG.id]
  subnet_id              = aws_subnet.subnet2.id
  user_data              = base64encode(file("userdata.sh"))

  tags = {
    Name = "VM2"
  }

}