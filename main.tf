provider "aws" {
    profile = "default"
    region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.0"

  backend "local" {}
}

/*resource "aws_instance" "app-server" {
    count = "${lookup(var.app_ami_count, terraform.workspace)}"
    ami = "ami-2757f631"
    instance_type = "${lookup(var.app_ami_instance_type, terraform.workspace)}"
    tags = {
        Name = "${terraform.workspace}-app-${count.index + 1}"
    }
    
}
*/

module "vpc" {
  source = "/modules/vpc"

  name                 = "${terraform.workspace}-${provider.region}"
  cidr                 = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  azs                 = ["${provider.region}a", "${provider.region}b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnets    = ["10.0.21.0/24", "10.0.22.0/24"]
  elasticache_subnets = ["10.0.31.0/24", "10.0.32.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Owner       = "Platform Team"
    Environment = "${terraform.workspace}-environment"
    Name        = "${terraform.workspace}-environment"
  }
}
