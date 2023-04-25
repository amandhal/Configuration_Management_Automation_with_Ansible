# Availability Zones
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
  type    = list(string)
}