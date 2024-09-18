output "resource_vm" {
  value = {
    id = aws_instance.vm-instance.id
    name = aws_instance.vm-instance.name
    url = aws_instance.vm-instance.url
    instance_type = aws_instance.vm-instance.instance_type
    tags = aws_instance.vm-instance.tags
  }
}

output "resource_vm_key_pair" {
  value = {
    id = aws_key_pair.vm-instance-key.id
    name = aws_key_pair.vm-instance-key.name
    url = aws_key_pair.vm-instance-key.url
    key_type = aws_key_pair.vm-instance-key.key_type
    tags = aws_key_pair.vm-instance-key.tags
  }
}

output "vm_id" {
  value = aws_instance.vm-instance.id
}

output "vm_region" {
  value = aws_instance.vm-instance.availability_zone
}

output "vm_name" {
  value = var.project_tags["Name"]
}

output "vm_arn" {
  value = aws_instance.vm-instance.arn
}

output "vm_instance_type" {
  value = aws_instance.vm-instance.instance_type
}

output "vm_ami_name" {
  value = data.aws_ami.choose_ami.filter.name
}

output "vm_private_ip" {
  value = aws_instance.vm-instance.private_ip
}

output "vm_public_ip" {
  value = aws_instance.vm-instance.public_ip
}

output "vm_subnet_attached" {
  value = aws_instance.vm-instance.subnet_id
}

output "vm_keypair_id" {
  value = aws_key_pair.vm-instance-key.id
}

output "vm_keypair_name" {
  value = aws_key_pair.vm-instance-key.key_name
}