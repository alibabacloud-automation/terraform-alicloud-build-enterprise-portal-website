output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.build_website.vpc_id
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.build_website.vswitch_id
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = module.build_website.rds_instance_id
}

output "rds_connection_string" {
  description = "The connection string of the RDS instance"
  value       = module.build_website.rds_instance_connection_string
}

output "database_name" {
  description = "The name of the created database"
  value       = module.build_website.database_name
}

output "ros_stack_id" {
  description = "The ID of the ROS stack"
  value       = module.build_website.ros_stack_id
}

output "mobi_console_url" {
  description = "The URL of the Mobi console"
  value       = module.build_website.mobi_console_url
}