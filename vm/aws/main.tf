data "aws_ami" "choose_ami" {
  most_recent = true

  filter {
    name   = var.filter_ami_name
    values = var.filter_ami_path
  }
}

resource "aws_instance" "ec2-instance" {
  ami = var.ami 
  key_name = aws_key_pair.ec2-instance-key.key_name ? [1] : []
  instance_type = var.instance_type ? [1] : []
  associate_public_ip_address = var.associate_public_ip ? [1] : []
  availability_zone = var.availability_zones ? [1] : []
  subnet_id = var.subnet_id ? [1] : []

  tags = concat({
    Project     = "${var.project_name}"
    Environment = "${var.project_env}"
    iac         = "Terraform"
    service     = "EC2"
    },
    var.project_tags)
}

resource "aws_key_pair" "ec2-instance-key" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = concat({
    Project     = "${var.project_name}"
    Environment = "${var.project_env}"
    iac         = "Terraform"
    service     = "Key Pair"
    },
    var.project_tags)
}