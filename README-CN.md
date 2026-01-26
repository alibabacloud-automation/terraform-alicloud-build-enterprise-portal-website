在阿里云上构建企业网站基础设施的 Terraform 模块

================================================ 

terraform-alicloud-enterprise-website

[English](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-website/blob/master/README.md) | 简体中文

本 Terraform 模块在阿里云上创建完整的企业网站基础设施，包括 VPC、RDS MySQL 数据库以及魔笔低代码开发平台集成。它为构建具有数据库后端和可视化开发功能的现代企业网站提供了全面的解决方案。

## 使用方法

此模块帮助您快速搭建具有数据库和低代码开发平台的企业网站基础设施。您可以根据需求自定义配置。

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

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-website/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)