variable "region" {
  type        = string
  description = "The region where resources will be created."
  default     = "eu-central-1"
}

variable "app_name" {
  type        = string
  description = "Application name prefix for all resources."
  default     = "mobi-app"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC."
  default     = "192.168.0.0/16"
}

variable "vswitch_cidr_block" {
  type        = string
  description = "CIDR block for the VSwitch."
  default     = "192.168.1.0/24"
}

variable "db_user_name" {
  type        = string
  description = "Username for the database account."
  default     = "db_user"
}

variable "db_password" {
  type        = string
  description = "Password for the database account."
  sensitive   = true
  default     = "tf_example123"
}

variable "db_name" {
  type        = string
  description = "Name of the database to create."
  default     = "db_name"
}