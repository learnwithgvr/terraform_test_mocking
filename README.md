# # Terrraform Test Mocking

## Objective

Perform Unit and Integration tests on a terraform Infrastructure as code repository which creates S3 bucket and retrives S3 bucket

## Project tree

```bash
.
├── README.md
├── main.tf
├── provider.tf
├── terraform.tfvars
├── testing
│   └── aws
│       └── data.tfmock.hcl
└── tests
    ├── mock_providers.tftest.hcl
    ├── mock_resource1.tftest.hcl
    ├── mock_resource2.tftest.hcl
    ├── override_test1.tftest.hcl
    ├── override_test2.tftest.hcl
    └── override_test3.tftest.hcl
```

### Terraform Test files

mock_providers.tftest.hcl
mock_resource1.tftest.hcl
mock_resource2.tftest.hcl
override_test1.tftest.hcl
override_test2.tftest.hcl
override_test3.tftest.hcl

#### Commands to Run the terraform init, plan

```bash
terraform init 
terraform plan
```

#### Commands to Run the terraform test mocking

```bash
terraform test -filter tests/mock_providers.tftest.hcl
terraform test -filter tests/mock_resource1.tftest.hcl
terraform test -filter tests/mock_resource2.tftest.hcl 
terraform test -filter tests/override_test1.tftest.hcl
terraform test -filter tests/override_test2.tftest.hcl 
terraform test -filter tests/override_test3.tftest.hcl 
```

### Youtube video tutorial

- [Terraform Test Mocking - Terraform v1.7.0 Mocking Framework](www.youtube.com/@learnwithgvr)
