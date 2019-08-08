provider "aws" {
    profile = "default"
    region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.0"

  backend "local" {}
}

resource "aws_instance" "app-server" {
    count = "${lookup(var.app_ami_count, terraform.workspace)}"
    ami = "ami-2757f631"
    instance_type = "${lookup(var.app_ami_instance_type, terraform.workspace)}"
    tags = {
        Name = "${terraform.workspace}-app-${count.index + 1}"
    }
    
}
