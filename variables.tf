variable "app_ami_count" {
  type = "map"
  default = {
    "china-prod" = "2"
    "china-test" = "1"
  }
}
variable "app_ami_instance_type" {
  type = "map"
  default = {
    "china-prod" = "c5.large"
    "china-test" = "t2.small"
  }
}
variable "provider_name" {
  type = "map"
  default = {
    "china-prod" = "aws"
    "china-test" = "aws"
  }
}

variable "default_region" {
  type = "map"
  default = {
    "china-prod" = "ningxia"
    "china-test" = "beijing"
  }
}

variable "provider_version" {
  type = "map"
  default = {
    "china-prod" = "1.7"
    "china-test" = "1.8"
  }
}
