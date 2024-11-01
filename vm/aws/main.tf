data "aws_ami" "choose_ami" {
  most_recent = true

  filter {
    name   = var.filter_ami_name
    values = var.filter_ami_path
  }
}

resource "aws_instance" "vm-instance" {
  count                       = var.vm_count
  ami                         = data.aws_ami.choose_ami.id
  key_name                    = aws_key_pair.vm-instance-key.key_name != null ? aws_key_pair.vm-instance-key.key_name : null
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip ? true : false
  availability_zone           = var.availability_zones
  subnet_id                   = var.subnet_id

  tags = {
    "Name" : "my-vm-${var.vm_count}"
  }
  depends_on = [aws_key_pair.vm-instance-key]
}

resource "aws_key_pair" "vm-instance-key" {
  key_name   = var.key_name
  public_key = var.public_key
}
