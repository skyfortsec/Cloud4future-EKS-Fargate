variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "project" {
  type    = string
  default = "cloud4future"
}

variable "cluster_name" {
  type    = string
  default = "cloud4future-eks-fargate"
}

variable "my_public_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR format (e.g., 81.102.45.77/32) for access to cluster public endpoint"
  default     = "0.0.0.0/0"
}

variable "ecr_repo_name" {
  type    = string
  default = "cloud4future-node"
}
