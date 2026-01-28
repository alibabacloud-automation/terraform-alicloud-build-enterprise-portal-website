Terraform module for building enterprise website infrastructure on Alibaba Cloud

# terraform-alicloud-build-enterprise-portal-website

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-build-enterprise-portal-website/blob/main/README-CN.md)

This Terraform module creates a complete enterprise website infrastructure on Alibaba Cloud, including VPC, RDS MySQL database, and Mobi low-code development platform integration. It provides a comprehensive solution for building modern enterprise websites with database backend and visual development capabilities.

## Usage

This module helps you quickly set up enterprise website infrastructure with database and low-code development platform. You can customize the configuration according to your requirements.

```terraform
module "enterprise_website" {
  source = "alibabacloud-automation/build-enterprise-portal-website/alicloud"

  common_name = "my-enterprise-site"

  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "enterprise-vpc"
  }

  vswitch_config = {
    cidr_block   = "192.168.1.0/24"
    vswitch_name = "enterprise-vswitch"
  }

  rds_account_config = {
    account_name     = "admin"
    account_password = "YourSecurePassword123!"
    account_type     = "Super"
  }

  db_database_config = {
    name          = "enterprise_db"
    description   = "Database for enterprise website"
    character_set = "utf8mb4"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-build-enterprise-portal-website/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_db_connection.rds_connection](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_connection) | resource |
| [alicloud_db_database.rds_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.rds_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_rds_account.rds_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_ros_stack.mobi_stack](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ros_stack) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_connection_config"></a> [db\_connection\_config](#input\_db\_connection\_config) | Configuration for the RDS database connection. The attribute 'connection\_prefix' is required. | <pre>object({<br>    connection_prefix = string<br>  })</pre> | <pre>{<br>  "connection_prefix": "mobiapp"<br>}</pre> | no |
| <a name="input_db_database_config"></a> [db\_database\_config](#input\_db\_database\_config) | Configuration for the RDS database. All attributes are required. | <pre>object({<br>    name          = string<br>    description   = string<br>    character_set = string<br>  })</pre> | <pre>{<br>  "character_set": "utf8mb4",<br>  "description": "database for mobi app",<br>  "name": "db_name"<br>}</pre> | no |
| <a name="input_db_instance_config"></a> [db\_instance\_config](#input\_db\_instance\_config) | Configuration for the RDS instance. All attributes are required. | <pre>object({<br>    engine                 = string<br>    engine_version         = string<br>    instance_storage       = number<br>    instance_type          = string<br>    additional_security_ip = string<br>  })</pre> | <pre>{<br>  "additional_security_ip": "101.200.211.106",<br>  "engine": "MySQL",<br>  "engine_version": "8.0",<br>  "instance_storage": 40,<br>  "instance_type": "mysql.n4.small"<br>}</pre> | no |
| <a name="input_mobi_app_name"></a> [mobi\_app\_name](#input\_mobi\_app\_name) | The name of the mobi app. | `string` | `"mobi-app"` | no |
| <a name="input_rds_account_config"></a> [rds\_account\_config](#input\_rds\_account\_config) | Configuration for the RDS account. All attributes are required. | <pre>object({<br>    account_name     = string<br>    account_password = string<br>    account_type     = string<br>  })</pre> | <pre>{<br>  "account_name": "db_user",<br>  "account_password": null,<br>  "account_type": "Super"<br>}</pre> | no |
| <a name="input_ros_stack_config"></a> [ros\_stack\_config](#input\_ros\_stack\_config) | Configuration for the ROS stack. The attribute 'stack\_name' is required. | <pre>object({<br>    stack_name = string<br>  })</pre> | <pre>{<br>  "stack_name": "mobi-app-stack"<br>}</pre> | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for the VPC. The attribute 'cidr\_block' is required. | <pre>object({<br>    cidr_block = string<br>    vpc_name   = optional(string, null)<br>  })</pre> | <pre>{<br>  "cidr_block": "192.168.0.0/16"<br>}</pre> | no |
| <a name="input_vswitch_config"></a> [vswitch\_config](#input\_vswitch\_config) | Configuration for the VSwitch. The attribute 'cidr\_block' is required. | <pre>object({<br>    cidr_block   = string<br>    zone_id      = string<br>    vswitch_name = optional(string, null)<br>  })</pre> | <pre>{<br>  "cidr_block": "192.168.1.0/24",<br>  "zone_id": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | The availability zone of the VSwitch |
| <a name="output_database_character_set"></a> [database\_character\_set](#output\_database\_character\_set) | The character set of the database |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The name of the created database |
| <a name="output_mobi_console_url"></a> [mobi\_console\_url](#output\_mobi\_console\_url) | The URL of the Mobi console |
| <a name="output_rds_account_name"></a> [rds\_account\_name](#output\_rds\_account\_name) | The name of the RDS account |
| <a name="output_rds_account_status"></a> [rds\_account\_status](#output\_rds\_account\_status) | The status of the RDS account |
| <a name="output_rds_instance_connection_string"></a> [rds\_instance\_connection\_string](#output\_rds\_instance\_connection\_string) | The connection string of the RDS instance |
| <a name="output_rds_instance_id"></a> [rds\_instance\_id](#output\_rds\_instance\_id) | The ID of the RDS instance |
| <a name="output_rds_instance_port"></a> [rds\_instance\_port](#output\_rds\_instance\_port) | The port of the RDS instance |
| <a name="output_ros_stack_id"></a> [ros\_stack\_id](#output\_ros\_stack\_id) | The ID of the ROS stack |
| <a name="output_ros_stack_name"></a> [ros\_stack\_name](#output\_ros\_stack\_name) | The name of the ROS stack |
| <a name="output_ros_stack_status"></a> [ros\_stack\_status](#output\_ros\_stack\_status) | The status of the ROS stack |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)