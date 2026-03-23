resource "aws_instance" "example" {
  count         = var.create_instance ? length(var.environments) : 2
  ami           = "ami-0c94855ba95c71c99"
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
	Name        = "Terraform-${var.environments[count.index]}"
	Environment = var.environments[count.index]
  }
}