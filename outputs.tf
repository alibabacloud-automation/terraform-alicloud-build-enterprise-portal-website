output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "availability_zone" {
  description = "The availability zone of the VSwitch"
  value       = alicloud_vswitch.vswitch.zone_id
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = alicloud_db_instance.rds_instance.id
}

output "rds_instance_connection_string" {
  description = "The connection string of the RDS instance"
  value       = alicloud_db_connection.rds_connection.connection_string
}

output "rds_instance_port" {
  description = "The port of the RDS instance"
  value       = alicloud_db_connection.rds_connection.port
}

output "database_name" {
  description = "The name of the created database"
  value       = alicloud_db_database.rds_database.data_base_name
}

output "database_character_set" {
  description = "The character set of the database"
  value       = alicloud_db_database.rds_database.character_set
}

output "rds_account_name" {
  description = "The name of the RDS account"
  value       = alicloud_rds_account.create_db_user.account_name
}

output "rds_account_status" {
  description = "The status of the RDS account"
  value       = alicloud_rds_account.create_db_user.status
}

output "ros_stack_id" {
  description = "The ID of the ROS stack"
  value       = alicloud_ros_stack.mobi_stack.id
}

output "ros_stack_name" {
  description = "The name of the ROS stack"
  value       = alicloud_ros_stack.mobi_stack.stack_name
}

output "ros_stack_status" {
  description = "The status of the ROS stack"
  value       = alicloud_ros_stack.mobi_stack.status
}

output "mobi_console_url" {
  description = "The URL of the Mobi console"
  value       = "https://mobinext.console.aliyun.com/"
}