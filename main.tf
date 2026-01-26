locals {
  mobi_template = <<-JSON
  {
    "ROSTemplateFormatVersion": "2015-09-01",
    "Resources": {
      "MobiWorkspaces": {
        "Type": "DATASOURCE::MOBI::Workspaces"
      },
      "Mobi": {
        "Type": "ALIYUN::MOBI::App",
        "Properties": {
          "AppName": "${var.mobi_app_name}",
          "AppIcon": -1,
          "AppWorkspaceId": {
            "Fn::Select": [
              0,
              {
                "Fn::GetAtt": [
                  "MobiWorkspaces",
                  "WorkspaceIds"
                ]
              }
            ]
          },
          "AppType": "Web",
          "Template": {
            "TemplateId": "e1e78223-38c4-4184-972c-ac0eead93e11",
            "ConnectionsContent": "[{\n  \"name\": \"企业官网模板_${var.ros_stack_config.stack_name}\",\n  \"connectorType\": {\n    \"kind\": \"mysql\",\n    \"name\": \"mysql\"\n  },\n  \"folderId\": \"/\",\n  \"resourceRequirementId\": \"7dfe969b-1d54-4cbc-a8fd-209000b30ad0\",\n  \"resourceObject\": {\n    \"version\": \"1.0\",\n    \"id\": \"7dfe969b-1d54-4cbc-a8fd-209000b30ad0\",\n    \"name\": \"企业官网模板_20241203160633\",\n    \"type\": \"sql\",\n    \"subType\": \"mysql\",\n    \"connectionTemplates\": {\n      \"dev\": {\n        \"host\": \"${alicloud_db_connection.rds_connection.connection_string}\",\n        \"port\": 3306,\n        \"database\": \"${alicloud_db_database.rds_database.data_base_name}\",\n        \"username\": \"${alicloud_rds_account.create_db_user.account_name}\",\n        \"password\": \"${alicloud_rds_account.create_db_user.account_password}\"\n      },\n      \"product\": {\n        \"host\": \"${alicloud_db_connection.rds_connection.connection_string}\",\n        \"port\": 3306,\n        \"database\": \"${alicloud_db_database.rds_database.data_base_name}\",\n        \"username\": \"${alicloud_rds_account.create_db_user.account_name}\",\n        \"password\": \"${alicloud_rds_account.create_db_user.account_password}\"\n      }\n    }\n  }\n}]"
         }
        }
      }
    }
  }
  JSON
}

# VPC resource definition
resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_config.vpc_name
  cidr_block = var.vpc_config.cidr_block
}

# VSwitch resource definition
resource "alicloud_vswitch" "vswitch" {
  zone_id      = var.vswitch_config.zone_id
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  vswitch_name = var.vswitch_config.vswitch_name
}

# RDS instance definition
resource "alicloud_db_instance" "rds_instance" {
  engine           = var.db_instance_config.engine
  engine_version   = var.db_instance_config.engine_version
  instance_type    = var.db_instance_config.instance_type
  instance_storage = var.db_instance_config.instance_storage
  vpc_id           = alicloud_vpc.vpc.id
  vswitch_id       = alicloud_vswitch.vswitch.id
  security_ips     = [alicloud_vpc.vpc.cidr_block, var.db_instance_config.additional_security_ip]
}

# RDS database definition
resource "alicloud_db_database" "rds_database" {
  data_base_name = var.db_database_config.name
  description    = var.db_database_config.description
  instance_id    = alicloud_db_instance.rds_instance.id
  character_set  = var.db_database_config.character_set
}

# RDS account definition
resource "alicloud_rds_account" "create_db_user" {
  db_instance_id   = alicloud_db_instance.rds_instance.id
  account_name     = var.rds_account_config.account_name
  account_password = var.rds_account_config.account_password
  account_type     = var.rds_account_config.account_type
}

resource "alicloud_db_connection" "rds_connection" {
  depends_on        = [alicloud_rds_account.create_db_user]
  instance_id       = alicloud_db_instance.rds_instance.id
  connection_prefix = var.db_connection_config.connection_prefix
}

# ROS Stack definition
resource "alicloud_ros_stack" "mobi_stack" {
  depends_on    = [alicloud_db_connection.rds_connection]
  stack_name    = var.ros_stack_config.stack_name
  template_body = local.mobi_template
}
