# Complete Example

This example demonstrates how to use the build-a-website module to create a complete enterprise website infrastructure on Alibaba Cloud.

## What This Example Creates

This example creates the following resources:

- **VPC**: A virtual private cloud with the specified CIDR block
- **VSwitch**: A virtual switch in the VPC for resource deployment
- **RDS MySQL Instance**: A managed MySQL database instance
- **RDS Database**: A database within the RDS instance
- **RDS Account**: A database user account with appropriate permissions
- **Database Connection**: A connection endpoint for the database
- **ROS Stack**: A Resource Orchestration Service stack that deploys the Mobi application
- **Mobi Application**: A low-code development platform application for building enterprise websites

## Prerequisites

1. Alibaba Cloud account with appropriate permissions
2. Terraform >= 1.0 installed
3. Alibaba Cloud Provider configured

## Usage

1. Clone this repository and navigate to this example:
   ```bash
   cd examples/complete
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. After successful deployment, you can access the Mobi console using the provided URL to manage your low-code application.

## Important Notes

- **Database Password**: Make sure to use a strong password for the database account. The password must contain at least three of the following character types: uppercase letters, lowercase letters, digits, and special characters.
- **Resource Naming**: Resources are automatically named with a random suffix to avoid naming conflicts.
- **Security**: The RDS instance is configured with security groups that allow access from the VPC CIDR and a specific IP address (101.200.211.106). Modify the `additional_security_ip` in the module configuration if needed.
- **Mobi Console**: After deployment, access the Mobi console at https://mobinext.console.aliyun.com/ to manage your application.

## Cleanup

To destroy the created resources:

```bash
terraform destroy
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_build_website"></a> [build\_website](#module\_build\_website) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_integer.app_name_random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/db_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name prefix for all resources. | `string` | `"mobi-app"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database to create. | `string` | `"db_name"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the database account. | `string` | `"tf_example123"` | no |
| <a name="input_db_user_name"></a> [db\_user\_name](#input\_db\_user\_name) | Username for the database account. | `string` | `"db_user"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where resources will be created. | `string` | `"eu-central-1"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block for the VPC. | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vswitch_cidr_block"></a> [vswitch\_cidr\_block](#input\_vswitch\_cidr\_block) | CIDR block for the VSwitch. | `string` | `"192.168.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The name of the created database |
| <a name="output_mobi_console_url"></a> [mobi\_console\_url](#output\_mobi\_console\_url) | The URL of the Mobi console |
| <a name="output_rds_connection_string"></a> [rds\_connection\_string](#output\_rds\_connection\_string) | The connection string of the RDS instance |
| <a name="output_rds_instance_id"></a> [rds\_instance\_id](#output\_rds\_instance\_id) | The ID of the RDS instance |
| <a name="output_ros_stack_id"></a> [ros\_stack\_id](#output\_ros\_stack\_id) | The ID of the ROS stack |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
<!-- END_TF_DOCS -->