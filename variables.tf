variable "vpc_config" {
  type = object({
    cidr_block = string
    vpc_name   = optional(string, null)
  })
  description = "Configuration for the VPC. The attribute 'cidr_block' is required."
  default = {
    cidr_block = "192.168.0.0/16"
  }
}

variable "vswitch_config" {
  type = object({
    cidr_block   = string
    zone_id      = string
    vswitch_name = optional(string, null)
  })
  description = "Configuration for the VSwitch. The attribute 'cidr_block' is required."
  default = {
    cidr_block = "192.168.1.0/24"
    zone_id    = null
  }
}

variable "db_instance_config" {
  type = object({
    engine                 = string
    engine_version         = string
    instance_storage       = number
    instance_type          = string
    additional_security_ip = string
  })
  description = "Configuration for the RDS instance. All attributes are required."
  default = {
    engine                 = "MySQL"
    engine_version         = "8.0"
    instance_storage       = 40
    instance_type          = "mysql.n4.small"
    additional_security_ip = "101.200.211.106"
  }
}

variable "db_database_config" {
  type = object({
    name          = string
    description   = string
    character_set = string
  })
  description = "Configuration for the RDS database. All attributes are required."
  default = {
    name          = "db_name"
    description   = "database for mobi app"
    character_set = "utf8mb4"
  }
}

variable "rds_account_config" {
  type = object({
    account_name     = string
    account_password = string
    account_type     = string
  })
  description = "Configuration for the RDS account. All attributes are required."
  sensitive   = true
  default = {
    account_name     = "db_user"
    account_password = null
    account_type     = "Super"
  }
}

variable "db_connection_config" {
  type = object({
    connection_prefix = string
  })
  description = "Configuration for the RDS database connection. The attribute 'connection_prefix' is required."
  default = {
    connection_prefix = "mobiapp"
  }
}

variable "ros_stack_config" {
  type = object({
    stack_name = string
  })
  description = "Configuration for the ROS stack. The attribute 'stack_name' is required."
  default = {
    stack_name = "mobi-app-stack"
  }
}

variable "mobi_app_name" {
  type        = string
  description = "The name of the mobi app."
  default     = "mobi-app"
}
