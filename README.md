
# Lab 2 – Multi-stage Terraform Landing Zone (GitHub Actions)

This repository implements a **multi-stage** deployment of Azure services using **Terraform** and **GitHub Actions**. Each stage is an independent Terraform stack:

- **Stage 1 (01-foundation)**: Private **Storage Account** + **Key Vault**
- **Stage 2 (02-app-plan)**: **App Service Plan** (Linux)
- **Stage 3 (03-web-app)**: **Linux Web App** (depends on Stage 2)

We intentionally **do not** create Resource Groups or VNets, as requested.

## Prerequisites
- Existing Azure **Resource Group** to deploy into.
- Azure AD Application (Service Principal) configured with **OIDC** federated credentials for this GitHub repo.
- GitHub repository secrets set:
  - `AZURE_CLIENT_ID`
  - `AZURE_TENANT_ID`
  - `AZURE_SUBSCRIPTION_ID`
- Optional but recommended: Azure Storage Account + container `tfstate` for **remote Terraform state**.

## Repo Structure
```
lab2-landing-zone/
├── stacks/
│   ├── 01-foundation/
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── 02-app-plan/
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── 03-web-app/
│       ├── provider.tf
│       ├── variables.tf
│       ├── main.tf
│       └── outputs.tf
├── modules/
│   ├── storage_account/
│   ├── key_vault/
│   ├── app_service_plan/
│   └── web_app/
└── .github/workflows/lab2-terraform.yml
```

## Remote State
Each stack's `provider.tf` includes a **backend** configuration with placeholders. Fill in your **tfstate RG** and **Storage Account**:
```hcl
backend "azurerm" {
  resource_group_name  = "<tfstate-rg>"
  storage_account_name = "<tfstate-sa>"
  container_name       = "tfstate"
  key                  = "lab2/01-foundation.tfstate"  # adjust per stack
}
```
Use unique `key` per stack:
- `lab2/01-foundation.tfstate`
- `lab2/02-app-plan.tfstate`
- `lab2/03-web-app.tfstate`

## How to run (GitHub Actions)
- Push to `main` or run **Workflow dispatch** for `Lab 2 – Multi-stage Terraform Deploy`.
- The workflow runs three jobs (Stage 1 → Stage 2 → Stage 3). Each job performs `init`, `validate`, `plan`, `apply`.
- Set/override TF variables in workflow `env:` or in **Actions → Variables**.

## Clean-up
Run a manual destroy in each stack locally or add a separate workflow with `terraform destroy` steps.

## Notes
- Storage Account & Key Vault have `public_network_access_enabled = false` and strict network rules for a private posture (without VNets/PEs).
- Web App uses **System Assigned Managed Identity** and `https_only = true`.
- Resource constraints: Storage account name must be globally unique, lowercase, 3–24 chars.
