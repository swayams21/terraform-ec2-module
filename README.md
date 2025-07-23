Here is your complete, updated `README.md` file with **embedded Terraform code snippets** for both the root and module-level files:
```
git clone https://github.com/swayams21/terraform-ec2-module.git
cd terraform-ec2-module
terraform init
terraform plan
terraform apply
```
---

```markdown
# 🚀 Terraform EC2 Module Project

This project demonstrates provisioning EC2 instances in AWS using **Terraform modules** to promote code reuse and clean infrastructure management. Two environments are created: **dev** and **prod** using a shared module.

---

## 📁 Project Structure

```
.
├── main.tf                  # Root Terraform configuration
├── terraform.tfstate        # Terraform state file (auto-generated)
└── modules/
└── ec2/
├── main.tf          # EC2 resource definition
├── variables.tf     # Input variables for the EC2 module
└── outputs.tf       # Output values from the EC2 module

````

---

## 🔧 Root Configuration - `main.tf`

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "dev" {
  source        = "./modules/ec2"
  ami_id        = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
}

module "prod" {
  source        = "./modules/ec2"
  ami_id        = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.medium"
  tags = {
    Name = "dev"
  }
}
````

---

## 📦 Module Code (`modules/ec2/`)

### `main.tf`

```hcl
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
}
```

---

### `variables.tf`

```hcl
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "tags" {
  type = map(string)
}
```

---

### `outputs.tf`

```hcl
output "instance_id" {
  value = aws_instance.this.id
}
```

---

## 📤 Module Inputs

| Variable        | Type          | Description                       |
| --------------- | ------------- | --------------------------------- |
| `ami_id`        | `string`      | The AMI ID to launch the EC2      |
| `instance_type` | `string`      | EC2 instance type (e.g. t2.micro) |
| `tags`          | `map(string)` | Key-value tags for the instance   |

---

## 📥 Module Outputs

| Output        | Description               |
| ------------- | ------------------------- |
| `instance_id` | ID of the provisioned EC2 |

---

## ✅ How to Use

### Step 1: Initialize Terraform

```bash
terraform init
```

### Step 2: Validate Configuration

```bash
terraform validate
```

### Step 3: View Execution Plan

```bash
terraform plan
```

### Step 4: Apply to Provision Resources

```bash
terraform apply
```

> Type `yes` to confirm.

---

## 🔁 To Destroy Infrastructure

```bash
terraform destroy
```

---

## ⚠️ Prerequisites

* AWS CLI configured or valid AWS credentials exported as environment variables.
* Update `ami_id` based on your AWS region (e.g., use latest Amazon Linux 2 AMI).
* Terraform installed (`>=1.0` recommended).

---

## 👨‍💻 Author

**Swayamsiddha Savekar**


---

```

Let me know if you also want:

- Outputs displayed in CLI after `apply`
- `.gitignore` or `.terraform.lock.hcl` handling
- CI/CD integration example (e.g., GitHub Actions)
```
