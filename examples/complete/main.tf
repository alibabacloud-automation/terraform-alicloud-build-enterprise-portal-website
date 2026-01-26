provider "alicloud" {
  region = var.region
}

# Generate random integer for unique naming
resource "random_integer" "app_name_random" {
  min = 10000
  max = 99999
}

# 查询RDS支持的可用区
data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

locals {
  # 获取最后一个可用区
  zone_id = data.alicloud_db_zones.default.ids[0]
}

# 查询实例规格
data "alicloud_db_instance_classes" "default" {
  instance_charge_type     = "PostPaid"
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  category                 = "Basic"
  zone_id                  = local.zone_id
}

module "build_website" {
  source = "../../"

  vpc_config = {
    cidr_block = var.vpc_cidr_block
    vpc_name   = "${var.app_name}-vpc-${random_integer.app_name_random.result}"
  }

  vswitch_config = {
    cidr_block   = var.vswitch_cidr_block
    zone_id      = local.zone_id
    vswitch_name = "${var.app_name}-vsw-${random_integer.app_name_random.result}"
  }

  db_instance_config = {
    engine                 = "MySQL"
    engine_version         = "8.0"
    instance_storage       = 40
    instance_type          = data.alicloud_db_instance_classes.default.ids[length(data.alicloud_db_instance_classes.default.ids) - 1]
    additional_security_ip = "101.200.211.106"
  }

  db_database_config = {
    name          = var.db_name
    description   = "database for mobi app"
    character_set = "utf8mb4"
  }

  rds_account_config = {
    account_name     = var.db_user_name
    account_password = var.db_password
    account_type     = "Super"
  }

  db_connection_config = {
    connection_prefix = "mobiapp${random_integer.app_name_random.result}"
  }

  ros_stack_config = {
    stack_name = "mobi-app-stack-${random_integer.app_name_random.result}"
  }

  mobi_app_name = "mobi-app-${random_integer.app_name_random.result}"
}