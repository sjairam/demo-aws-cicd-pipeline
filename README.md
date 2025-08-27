# AWS CI/CD Pipeline Demo

A demonstration of implementing a complete CI/CD pipeline for Terraform infrastructure using AWS services. This project showcases how to automate the deployment of infrastructure as code with proper planning, validation, and deployment stages.

## 🏗️ Architecture

This project implements a CI/CD pipeline using the following AWS services:

- **AWS CodePipeline**: Orchestrates the entire CI/CD workflow
- **AWS CodeBuild**: Executes Terraform commands in isolated build environments
- **AWS S3**: Stores pipeline artifacts and Terraform state
- **AWS IAM**: Manages permissions and roles for the pipeline
- **AWS CodeStar Connection**: Connects to your GitHub repository

## 📋 Pipeline Stages

The CI/CD pipeline consists of three main stages:

1. **Source Stage**: Pulls code from your GitHub repository
2. **Plan Stage**: Runs `terraform plan` to preview infrastructure changes
3. **Deploy Stage**: Executes `terraform apply` to deploy infrastructure

## 🚀 Features

- **Infrastructure as Code**: Complete Terraform configuration for the CI/CD pipeline
- **Automated Validation**: Terraform validation and planning before deployment
- **Secure Credentials**: Uses AWS Secrets Manager for Docker Hub and CodeStar credentials
- **State Management**: Centralized Terraform state storage in S3
- **IAM Best Practices**: Least-privilege access for pipeline execution

## 📁 Project Structure

```
demo-aws-cicd-pipeline/
├── buildspec/                    # AWS CodeBuild build specifications
│   ├── plan-buildspec.yml       # Plan stage buildspec
│   └── apply-buildspec.yml      # Apply stage buildspec
├── cicd-iam.tf                  # IAM roles and policies
├── cicd-pipeline.tf             # CodePipeline and CodeBuild resources
├── cicd-s3.tf                   # S3 bucket for artifacts and state
├── state.tf                     # Terraform backend configuration
├── terraform.tfvars             # Variable values (not in version control)
├── variables.tf                 # Variable definitions
└── README.md                    # This file
```

## 🛠️ Prerequisites

Before deploying this pipeline, ensure you have:

- **AWS CLI** configured with appropriate permissions
- **Terraform** installed (version 1.3.5 or later)
- **GitHub repository** with your infrastructure code
- **AWS CodeStar Connection** configured for your GitHub repository
- **Docker Hub credentials** stored in AWS Secrets Manager

## 🔧 Setup Instructions

### 1. Configure AWS CodeStar Connection

1. Go to AWS CodeStar console
2. Create a new connection to your GitHub repository
3. Note the connection ARN for use in `terraform.tfvars`

### 2. Store Docker Hub Credentials

1. Create a secret in AWS Secrets Manager with your Docker Hub credentials
2. Note the secret ARN for use in `terraform.tfvars`

### 3. Configure Variables

Create a `terraform.tfvars` file with your specific values:

```hcl
dockerhub_credentials = "arn:aws:secretsmanager:region:account:secret:dockerhub-credentials"
codestar_connector_credentials = "arn:aws:codestar-connections:region:account:connection/connection-id"
```

### 4. Deploy the Pipeline

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Deploy the pipeline
terraform apply
```

## 🔄 How It Works

1. **Code Push**: When you push code to your GitHub repository
2. **Pipeline Trigger**: AWS CodePipeline automatically detects the change
3. **Source Stage**: Downloads your code and prepares it for the pipeline
4. **Plan Stage**: 
   - Initializes Terraform
   - Validates configuration
   - Generates execution plan
5. **Deploy Stage**:
   - Applies the Terraform configuration
   - Deploys your infrastructure

## 🛡️ Security Features

- **Least Privilege Access**: IAM roles with minimal required permissions
- **Secure Credentials**: Sensitive data stored in AWS Secrets Manager
- **Isolated Builds**: Each build runs in a clean, isolated environment
- **Audit Trail**: Complete logging of all pipeline activities

## 📊 Monitoring and Logging

- **CloudWatch Logs**: All build and pipeline activities are logged
- **Pipeline Status**: Monitor pipeline execution in the AWS Console
- **Build Logs**: Detailed logs for each build stage available in CodeBuild

## 🧹 Cleanup

To remove all resources created by this pipeline:

```bash
terraform destroy
```

**⚠️ Warning**: This will destroy the entire CI/CD pipeline and any infrastructure it manages.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/sjairam/demo-aws-cicd-pipeline/issues) page
2. Create a new issue with detailed information about your problem
3. Include relevant logs and error messages

## 🔗 Useful Links

- [AWS CodePipeline Documentation](https://docs.aws.amazon.com/codepipeline/)
- [AWS CodeBuild Documentation](https://docs.aws.amazon.com/codebuild/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

---

**Note**: This is a demonstration project. For production use, consider implementing additional security measures, backup strategies, and monitoring solutions.
