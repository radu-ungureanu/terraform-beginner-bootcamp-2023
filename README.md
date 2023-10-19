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
