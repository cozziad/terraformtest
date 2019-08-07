provider "aws" {
    profile = "default"
    region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.0"

  backend "local" {}
}

resource "aws_instance" "example" {
    tags = {
        Name = "${terraform.workspace}"
    }
    count = "${lookup(var.ami_count, terraform.workspace)}"
    ami = "ami-2757f631"
    instance_type = "t2.micro"
}
