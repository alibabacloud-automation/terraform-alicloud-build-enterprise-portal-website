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

2. Create a `terraform.tfvars` file with your specific values:
   ```hcl
   region             = "cn-hangzhou"
   app_name           = "my-website"
   vpc_cidr_block     = "192.168.0.0/16"
   vswitch_cidr_block = "192.168.1.0/24"
   db_user_name       = "admin"
   db_password        = "YourSecurePassword123!"
   db_name            = "website_db"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

6. After successful deployment, you can access the Mobi console using the provided URL to manage your low-code application.

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

## Outputs

After successful deployment, the following outputs will be available:

- `vpc_id`: The ID of the created VPC
- `vswitch_id`: The ID of the created VSwitch
- `rds_instance_id`: The ID of the RDS instance
- `rds_connection_string`: The connection string for the database
- `database_name`: The name of the created database
- `ros_stack_id`: The ID of the ROS stack
- `mobi_console_url`: The URL to access the Mobi console