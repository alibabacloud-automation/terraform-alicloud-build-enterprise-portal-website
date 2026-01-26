Terraform module for building enterprise website infrastructure on Alibaba Cloud

================================================ 

terraform-alicloud-enterprise-website

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-website/blob/master/README-CN.md)

This Terraform module creates a complete enterprise website infrastructure on Alibaba Cloud, including VPC, RDS MySQL database, and Mobi low-code development platform integration. It provides a comprehensive solution for building modern enterprise websites with database backend and visual development capabilities.

## Usage

This module helps you quickly set up enterprise website infrastructure with database and low-code development platform. You can customize the configuration according to your requirements.

```terraform
module "enterprise_website" {
  source = "alibabacloud-automation/enterprise-website/alicloud"

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

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-website/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
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