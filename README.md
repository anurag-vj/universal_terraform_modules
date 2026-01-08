# terraform_infra_modules

This repository contains reusable Terraform modules for multiple cloud providers.

## Supported Cloud Providers
- Azure
- AWS (TBD)
- GCP (TBD)

## Repository Principles
- This repository contains **only reusable Terraform modules**
- No environment-specific code (dev / test / prod)
- No `terraform apply` executions from this repo
- No backend configuration or state files
- Modules must be provider-specific and isolated

## Repository Structure
terraform-modules/
├── azure/
├── aws/
├── gcp/


## License
MIT
