# Terraform Beginner Bootcamp 2023

## Semantic Versioning

This project is going to utilize [semantic versioning](https://semver.org/) for its tagging.

Given a version number **MAJOR.MINOR.PATCH**, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## AWS CLI

In order for the CLI to work correctly, we need to [set some environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html).

**To set for all sessions:**

```sh
setx AWS_ACCESS_KEY_ID AKIAIOSFODNN7EXAMPLE
setx AWS_SECRET_ACCESS_KEY wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
setx AWS_DEFAULT_REGION us-west-2
```

### Commands

- `aws sts get-caller-identity` - check if AWS credentials is configured correctly

## Terraform CLI

### Registry

Terraform sources their providers and modules from the Terraform registry which is located at [registry.terraform.io](http://registry.terraform.io).

- **Providers** are interfaces to APIs that allow to create resources in Terraform
   - [Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)
- **Modules** are a way to make large amounts of terraform modular, portable and shareable.

### Commands

We can see a list of all Terraform commands by simply typing `terraform`.

- `terraform init` - at the start of a new project we need to run this command to download the binaries for the terraform providers that are used in the project. This needs to be ran whenever a new provider is added, to download the necessary binaries
- `terraform plan` - generates a changeset about the state of the instrastrucutre and what will be changed
- `terraform apply` - runs a plan and passes the changeset to be executed. Manual approval is required to actually create the resources
- `terraform apply --auto-approve` - `--auto-approve` is used to skip the prompt for the manual approval
- `terraform output`
- `terraform destroy` - destroys all the created resources. Manual approval is required to actually destroy the resources
- `terraform destroy --auto-approve` - `--auto-approve` is used to skip the prompt for the manual approval

### Lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform lock file **should** be committed to git.

### State files

Contains information about the current state of the infrastructure.

The Terraform state file **should not** be committed to git, as it can contain sensitive data.

If this file is lost, the state of the current inftrastructure is lost.

`.terraform.tfstate.backup` is the previous state generated by Terraform, before the new changeset was applied.

### Directory structure

- `.terraform` - contains executables for Terraform providers used in the infrastructure.
