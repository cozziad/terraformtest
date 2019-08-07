variable "ami_count" {
  type = "map"
  default = {
    "china-prod" = "2"
    "china-test" = "1"
  }
}