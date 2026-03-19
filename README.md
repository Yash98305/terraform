📦 Terraform BigQuery Dataset & Tables Setup

This project uses Terraform to provision datasets and tables in Google BigQuery on Google Cloud.

🚀 Features

Create multiple BigQuery datasets

Create multiple tables dynamically

Schema managed via JSON files

Scalable structure using for_each and flatten

Infrastructure as Code using Terraform

📁 Project Structure
terraform/
│── main.tf
│── terraform.tfvars
│── .gitignore
│── table_1_schema.json
│── table_2_schema.json
│── table_3_schema.json
│── table_4_schema.json
🧠 Architecture
Datasets & Tables Mapping
Dataset	Tables
dataset_1	table_1 (User), table_2 (Course)
dataset_2	table_3 (Product)
dataset_3	table_4 (Orders)
🗄️ Table Design
1. User Table (table_1)

user_id

email

password

course_id (logical relation)

created_at

2. Course Table (table_2)

course_id

course_name

description

price

3. Product Table (table_3)

product_id

product_name

description

price

4. Orders Table (table_4)

order_id

user_id

product_id

quantity

total_price

order_date

⚠️ Important Note

BigQuery does NOT support foreign key constraints.

Relationships like user_id, course_id, product_id are logical only

Use JOIN queries to relate data

⚙️ Prerequisites

Install Terraform

Install Google Cloud SDK

GCP Project with BigQuery enabled

🔐 Authentication

Run:

gcloud auth application-default login
▶️ Usage
1. Initialize Terraform
terraform init
2. Plan Execution
terraform plan -out=tfplan
3. Apply Changes
terraform apply tfplan
📄 Example terraform.tfvars
datasets = {
  "dataset_1" = [
    {
      table_id = "table_1"
      schema_file = "table_1_schema.json"
    },
    {
      table_id = "table_2"
      schema_file = "table_2_schema.json"
    }
  ],
  "dataset_2" = [
    {
      table_id = "table_3"
      schema_file = "table_3_schema.json"
    }
  ],
  "dataset_3" = [
    {
      table_id = "table_4"
      schema_file = "table_4_schema.json"
    }
  ]
}
🚫 .gitignore (Important)
.terraform/
*.tfstate
*.tfstate.*
tfplan
🔧 Best Practices

Do NOT commit:

.terraform/

terraform.tfstate

tfplan

Use remote backend (GCS) for state management

Use service accounts for production

📈 Future Improvements

Add partitioning & clustering

Use remote backend (GCS)

Integrate with CI/CD pipeline

Add data ingestion pipeline

🤝 Author

Yash Patel
