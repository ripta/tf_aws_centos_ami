variable "region" {
  default = "us-east-1"
}

variable "virttype" {
  default = "hvm"
}

variable "release" {
  default = "7.1"
}

output "ami_id" {
  value = "${lookup(var.amis, format(\"%s-%s-%s\", var.region, var.release, var.virttype))}"
}
