# Azure Terraform Lab

Welcome to the **Azure Terraform Lab**! This repository serves as a hands-on environment to create, manage, and version Terraform configurations for Microsoft Azure. It's intended for learning, testing, and experimenting with Infrastructure as Code (IaC) using Terraform on Azure.

## 🚀 Purpose

The main goals of this repository are:

- Practice writing and organizing Terraform code for Azure
- Manage infrastructure as code using Git version control
- Experiment with different Azure services and Terraform modules
- Build reusable patterns for Azure provisioning
- Test configurations safely before applying them to production environments

## 🛠️ Prerequisites

Before using this repository, make sure you have the following installed:

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- A valid Azure subscription

## 🔐 Authentication

Use the Azure CLI to log in and ensure Terraform has access to your Azure account:

```bash
az login
````

## 🚨 Warning

This repository is intended for **lab and testing purposes only**. Resources created in Azure may incur costs. Make sure to clean up your resources after testing:

```bash
terraform destroy
```

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

Happy coding with Terraform on Azure! 🚀
