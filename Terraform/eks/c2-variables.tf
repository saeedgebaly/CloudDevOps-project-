variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "devops-eks"
}

variable "vpc_id" {}

variable "private_subnets" {
  type = list(string)
}

variable "node_group_name" {
  default = "devops-node-group"
}

variable "desired_size" {
  default = 1
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 2
}


