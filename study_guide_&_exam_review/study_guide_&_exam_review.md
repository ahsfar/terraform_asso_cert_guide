# Study Guide


# 1. Understand Infrastructure as Code (IaC) concepts

## Study Guide: Learn about Infrastructure as Code (IaC)

[Infrastructure as Code - Video](https://www.hashicorp.com/resources/what-is-infrastructure-as-code)

[Introduction to IaC - Doc](https://developer.hashicorp.com/terraform/intro)

[Introduction to Infrastructure as Code with Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code)

[Infrastructure as Code in a Private or Public Cloud - Blog](https://www.hashicorp.com/blog/infrastructure-as-code-in-a-private-or-public-cloud)

[Terraform Use Cases - Doc](https://developer.hashicorp.com/terraform/intro/v1.1.x/use-cases)


<details><summary>Review: Understand Infrastructure as Code (IaC) concepts</summary>
<p>

### 1a. [Explain what IaC is](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=1a-,Explain%20what%20IaC%20is,-What%20is%20Terraform)


IaC (Infrastructure as Code) - Managing infrastructure using code and configuration files. Enables automation, scalability, and collaboration. Provides consistency, reproducibility, and simplifies resource management.

### 1b. [Describe advantages of IaC patterns](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20advantages%20of%20IaC%20patterns)

Automation, Consistency, Scalability, Reproducibility, Collaboration, Testing and Validation, Auditing and Compliance, Rapid Deployment & Disaster Recovery

</p>
</details>

# 2. Understand the purpose of Terraform (vs other IaC)

<details><summary>Review: Understand the purpose of Terraform (vs other IaC)</summary>
<p>

### 2a.	[Explain multi-cloud and provider-agnostic benefits](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Explain%20multi%2Dcloud%20and%20provider%2Dagnostic%20benefits)

Terraform simplifies multi-cloud infrastructure management and orchestration, enabling fault-tolerance and consistent workflows across multiple cloud providers.

### 2b.	[Explain the benefits of state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Explain%20the%20benefits%20of%20state)

- Mapping to the Real World: State allows Terraform to map configuration to actual resources, ensuring accurate representation and management.
- Metadata Tracking: State tracks resource dependencies and retains information about the order of destruction, enabling correct operation during resource deletion.
- Performance Optimization: State stores a cache of attribute values, improving performance by avoiding the need to query every resource on each run.
- Consistency in Teamwork: Remote state enables collaboration by ensuring that everyone works with the same state, allowing operations to be applied to the same resources.
- Syncing and Remote Locking: By using remote state, Terraform can prevent conflicts and ensure that each run begins with the most recent state, enhancing team coordination and avoiding accidental conflicts.

</p>
</details>

# 3. Understand Terraform basics

## Study Guide: Review Terraform fundamentals

[Get Started with Terraform - Tutorials](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)

[Purpose of Terraform State - Doc](https://developer.hashicorp.com/terraform/language/v1.1.x/state/purpose)

[Terraform Settings - Doc](https://developer.hashicorp.com/terraform/language/v1.1.x/settings)

[Manage Terraform Versions - Tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions)

[Providers Summary - Doc](https://developer.hashicorp.com/terraform/language/v1.1.x/providers)

[How Terraform Works with Plugins - Doc](https://developer.hashicorp.com/terraform/plugin/how-terraform-works)

[Provider Configuration - Doc](https://developer.hashicorp.com/terraform/language/v1.1.x/providers/configuration)

[Lock and Upgrade Provider Versions - Tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning)

[Dependency Lock File - Doc](https://developer.hashicorp.com/terraform/language/v1.1.x/files/dependency-lock)

<details><summary>Review: Understand Terraform basics</summary>
<p>

### 3a.	[Install and version Terraform providers](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Install%20and%20version%20Terraform%20providers)

- Providers in Terraform enable interaction with various cloud providers and APIs.
- Provider configurations are defined in the root module of the Terraform configuration.
- Configuration arguments specific to each provider are specified within a provider block.
- Expressions can be used in configuration arguments, but only with values known before applying the configuration.
- Multiple configurations for the same provider can be defined using alias meta-argument, useful for targeting different regions or environments.
- Default provider configurations are used when the provider is not explicitly configured for a resource.
- References to alternate provider configurations are in the form <PROVIDER NAME>.<ALIAS>.
- Alternate provider configurations can be selected for resources and modules using the provider meta-argument.
- The version meta-argument for provider configurations is deprecated and should be declared in the required_providers block instead.


```bash
provider "google" {
  project = "acme-app"
  region  = "us-central1"
}

```


```bash
# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```

```bash
terraform {
  required_providers {
    mycloud = {
      source  = "mycorp/mycloud"
      version = "~> 1.0"
      configuration_aliases = [ mycloud.alternate ]
    }
  }
}
```

- The "terraform" block in Terraform configuration is used to configure Terraform's behavior.
- The block can contain settings related to Terraform Cloud, backend configuration, required Terraform version, provider requirements, experimental language -features, and provider metadata.
- The "required_version" setting specifies the version constraint for the Terraform CLI.
- The "required_providers" block specifies the providers required by the module, including version constraints and source addresses.
- Experimental language features can be enabled using the "experiments" argument.
- Provider metadata can be passed using the "provider_meta" block.
- Care should be taken when using experimental features in production modules.

```bash
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
```

```bash
terraform {
  experiments = [example]
}
```

- Terraform configurations can have external dependencies: providers and modules.
- Dependency lock file (.terraform.lock.hcl) tracks provider dependencies.
- Lock file is created and updated automatically by Terraform during 'terraform init'.
- Lock file ensures consistent selection of provider versions.
- Changes to lock file should be reviewed and committed to version control.
- Checksum verification ensures package integrity.
- Trust on first use approach for new providers.
- Lock file changes can occur when adding new provider dependencies.

### 3b.	[Describe plugin-based architecture](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20plugin%2Dbased%20architecture)

- Terraform relies on plugins called providers to interact with various cloud providers, SaaS providers, and APIs.
- Providers add resource types and data sources that Terraform can manage.
- Providers are separate from Terraform and have their own release cadence and version numbers.
- The Terraform Registry hosts publicly available providers for different infrastructure platforms.
- Each provider has its own documentation, including resource types and arguments.
- Providers are declared in the Terraform configuration and can have specific settings.
- Providers are installed during initialization by Terraform Cloud, Terraform Enterprise, or the Terraform CLI.
- A dependency lock file ensures consistent provider versions and can be created using the CLI.
- The lock file should be committed to version control with the configuration.
- The Terraform Registry is the main source to find providers categorized as Official, Partner, Community, or Archived.

--

- Terraform is built on a plugin-based architecture.
- Terraform Core is the command line tool and communicates with Terraform Plugins using remote procedure calls (RPC).
- Terraform Plugins provide implementations for specific services or provisioners.
- Provider Plugins handle infrastructure provider-specific tasks such as authentication and defining resources.
- Provisioner Plugins execute commands or scripts on resources.
- Plugin discovery is performed during the terraform init command.
- Terraform compares installed plugins to configuration version constraints and selects the appropriate version.
- Plugins can be upgraded using the terraform init -upgrade command.

### 3c.	[Write Terraform configuration using multiple providers](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Write%20Terraform%20configuration%20using%20multiple%20providers)


- Provider configurations are declared in the root module of a Terraform configuration.
- A provider configuration is defined using a provider block, specifying the provider's name and configuration arguments.
- Multiple configurations for the same provider can be defined using the alias meta-argument.
- Default provider configurations are used if no specific configuration is set for a resource.
- Alternate provider configurations can be selected for specific resources or modules using the provider meta-argument.
- The version meta-argument in provider configurations is deprecated and should be declared in the required_providers block instead.

```bash
# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```


### 3d.	[Describe how Terraform finds and fetches providers](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20how%20Terraform%20finds%20and%20fetches%20providers)

- Terraform finds and fetches providers during the terraform init command.
- It looks for provider configurations in the Terraform configuration files.
- Providers are declared using the required_providers block.
- Terraform checks the providers declared in the configuration against the installed providers.
- If a provider is not installed or doesn't match the required version, Terraform fetches and installs the correct version.
Example:
- The Terraform configuration specifies required_providers for AWS and Google Cloud.
- During terraform init, Terraform checks if the required providers are installed.
- If not installed or the version doesn't match, Terraform fetches and installs the correct versions for AWS and Google Cloud providers.
  
```bash
provider "google" {
  project = "acme-app"
  region  = "us-central1"
}
```

</p>
</details>

# 4. Use Terraform outside the core workflow

## Study Guide: Learn more subcommands

[Command: state - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/state)

[Manage Resources in Terraform State - tutorial](https://developer.hashicorp.com/terraform/tutorials/state/state-cli)

[Command: import - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/import)

[Import usage tips - documentation](https://developer.hashicorp.com/terraform/cli/import/usage)

[Debugging Terraform - documentation](https://developer.hashicorp.com/terraform/internals/v1.1.x/debugging)

[Troubleshoot Terraform - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/troubleshooting-workflow#enable-terraform-logging)

<details><summary>Review: Use Terraform outside the core workflow</summary>
<p>


### 4a.	[Describe when to use terraform import to import existing infrastructure into your Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20when%20to%20use%20terraform%20import%20to%20import%20existing%20infrastructure%20into%20your%20Terraform%20state)

You can use the terraform import command to import existing infrastructure into your Terraform state in the following scenarios:

- Transitioning from manual provisioning: If you have existing infrastructure that was created outside of Terraform and you want to start managing it with Terraform, you can use terraform import to bring those resources under Terraform's management.

- Migrating between Terraform states: If you have resources that were previously managed by a different Terraform state file or configuration, you can use terraform import to import those resources into your current Terraform state.

- Reconstructing state file: If you accidentally deleted or lost your Terraform state file, but the infrastructure still exists, you can use terraform import to reconstruct the state by importing the existing resources.

- Collaboration with an existing infrastructure: If you join a team or project where infrastructure was already provisioned manually or with another tool, you can use terraform import to incorporate that existing infrastructure into your Terraform configuration and state.

Note: When using terraform import, ensure that you import each resource only once and associate it with the correct resource address. Importing the same object multiple times can lead to unwanted behavior in Terraform.

It's important to note that terraform import imports resources into the state file, but it doesn't generate the corresponding Terraform configuration. You'll need to manually define the resource block in your Terraform configuration to match the imported resource.

```bash
terraform import aws_instance.foo i-abcd1234

terraform import module.foo.aws_instance.bar i-abcd1234

terraform import 'aws_instance.baz[0]' i-abcd1234

terraform import 'aws_instance.baz["example"]' i-abcd1234
```

### 4b.	[Use terraform state to view Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20terraform%20state%20to%20view%20Terraform%20state)

- The terraform state command is used for advanced state management in Terraform.
- It allows you to view and modify the Terraform state without directly modifying the state file.
- The command has several subcommands that provide different functionalities.
- The subcommands can be used with both local state and remote state.
- When modifying the state, Terraform automatically creates backup files, and the path of these backup files can be controlled using the -backup option.
- Read-only subcommands, like list, do not write any backup files.
- The output and command-line structure of the terraform state subcommands are designed to be compatible with Unix command-line tools such as grep and awk.
- You can combine terraform state subcommands with other command-line tools for advanced filtering and modification of the state.

```bash
terraform state <subcommand> [options] [args]
```

### 4c.	[Describe when to enable verbose logging and what the outcome/value is](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20when%20to%20enable%20verbose%20logging%20and%20what%20the%20outcome/value%20is)

- Enable verbose logging in Terraform when you need detailed logs for debugging purposes.
- Setting the TF_LOG environment variable to any value enables detailed logs to appear on stderr.
- You can set TF_LOG to one of the log levels: TRACE, DEBUG, INFO, WARN, or ERROR to control the verbosity of the logs.
- When TF_LOG is set to JSON, logs are output at the TRACE level or higher and use a parseable JSON encoding for formatting.
- Enabling logging separately for Terraform itself and provider plugins can be done using the TF_LOG_CORE and TF_LOG_PROVIDER environment variables respectively.
- The TF_LOG_PATH environment variable can be set to specify a file where the log output should be appended.
- Enabling verbose logging helps in diagnosing issues, understanding Terraform's internal behavior, and identifying potential errors or misconfigurations.
- When encountering a bug or issue with Terraform, including the detailed log, preferably using a service like gist, can provide valuable information for troubleshooting and resolving the problem.

</p>
</details>

# 5. Interact with Terraform modules

## Study Guide: Use and create modules

[Reuse Configuration with Modules - (complete all tutorials)](https://developer.hashicorp.com/terraform/tutorials/modules)

[Finding and Using Modules - documentation](https://developer.hashicorp.com/terraform/registry/modules/use)

[Module versioning - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/modules/syntax#version)

[Input Variables - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/values/variables)

[Input Variables - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables)

[Output Values - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/values/outputs)

[Output Values - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs)

[Calling a Child Module - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/modules/syntax)

<details><summary>Review: Interact with Terraform modules</summary>
<p>

### 5a.	[Contrast and use different module source options including the public Terraform Registry](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Contrast%20and%20use%20different%20module%20source%20options%20including%20the%20public%20Terraform%20Registry)

- The Terraform Registry allows easy module discovery through search and filtering.
- Public registry modules are referenced using the syntax <NAMESPACE>/<NAME>/<PROVIDER>.
- Usage instructions are provided on the registry page, including required inputs.
- Modules are downloaded and cached using terraform init.
- Private registry modules have an additional hostname prefix in the source string.
- Configure credentials to access private registry modules.
- Modules in the registry are versioned using semantic versioning.
- Specify module version constraints to avoid breaking changes.

### 5b.	[Interact with module inputs and outputs](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Interact%20with%20module%20inputs%20and%20outputs)

- Input variables in Terraform allow customization of modules without modifying their source code.
- Variables are declared using a variable block with a unique name, type, and optional default value.
- Optional arguments include default values, type constraints, descriptions, validations, sensitivity, and nullability.
- Default values can be provided for variables, making them optional.
- Type constraints enforce accepted value types, including strings, numbers, booleans, and complex types like collections and objects.
- Input variable documentation provides a description of the variable's purpose and expected value.
- Custom validation rules can be defined for variables using the validation block.
- Sensitive variables can be marked as sensitive to prevent their values from being displayed in outputs.
- The nullable argument allows controlling whether a variable can have a null value.
- Other related topics include output values, local values, modules, and more.

```bash
variable "image_id" {
  type = string
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-west-1a"]
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}
```

```bash
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
```

- Modules in Terraform are containers for multiple resources used together.
- Modules can be called from other modules using module blocks.
- The source argument is mandatory and specifies the module's location.
- The version argument can be used to constrain acceptable module versions.
- Meta-arguments like count, for_each, providers, and depends_on provide additional functionality.
- Module output values can be declared and accessed by the calling module.
- Refactoring blocks can be used to preserve resource state when moving resources between modules.
- The -replace option allows forcing the replacement of specific resource instances.

```bash
# calling child module
module "servers" {
  source = "./app-cluster"

  servers = 5
}

# version
module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.0.5"

  servers = 3
}

# accessing module output values 
resource "aws_elb" "example" {
  # ...

  instances = module.servers.instance_ids
}

# replacing resources within a module
terraform plan -replace=module.example.aws_instance.example
```

### 5c.	[Describe variable scope within modules/child modules](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20variable%20scope%20within%20modules/child%20modules)

- Variables defined within a module are scoped to that module and can be accessed within the module's resources, data sources, and other configuration elements.
- Child modules can access variables from their parent module by using the module namespace. For example, module.parent_module.variable_name.
- Variables defined within a child module are scoped to that module and can be accessed within the child module's resources and configuration elements.

### 5d.	[Set module version](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=5d-,Set%20module%20version,-Module%20Versions)

To set the module version, use the "version" argument within the module block.
The "version" argument accepts a version constraint string.
Terraform will use the newest installed version of the module that meets the constraint.
Version constraints are supported for modules installed from a module registry.
Local file path modules share the same version as their caller.

```bash
module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.0.5"

  servers = 3
}
```

</p>
</details>

# 6. Use the core Terraform workflow

## Study Guide: Navigate the core workflow

[The Core Terraform Workflow - documentation](https://developer.hashicorp.com/terraform/intro/v1.1.x/core-workflow)

[Initialize a Terraform working directory with init - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/init)

[Initialize Terraform Configuration - tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/init)

[Validate a Terraform configuration with validate - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/validate)

[Command: plan - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/plan)

[Create a Terraform Plan - tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/plan)

[Command: apply - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/apply)

[Apply Terraform Configuration - tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/apply)

[Command: destroy - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/destroy)

[Command: fmt - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/commands/fmt)

[Troubleshoot Terraform - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/troubleshooting-workflow#format-the-configuration)

<details><summary>Review: Use the core Terraform workflow</summary>
<p>

### 6a. [Describe Terraform workflow ( Write -> Plan -> Create )	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20Terraform%20workflow%20(%20Write%20%2D%3E%20Plan%20%2D%3E%20Create%20))

Write: Author infrastructure configuration using Terraform's declarative language.

```bash
# Create repository
$ git init my-infra && cd my-infra

Initialized empty Git repository in /.../my-infra/.git/

# Write initial config
$ vim main.tf

# Initialize Terraform
$ terraform init

Initializing provider plugins...
# ...
Terraform has been successfully initialized!

# Make edits to config
$ vim main.tf

# Review plan
$ terraform plan

# Make additional edits, and repeat
$ vim main.tf
```

Plan: Analyze the configuration and generate an execution plan.

```bash
git add main.tf
git commit -m 'Managing infrastructure as code!'
```
Create: Apply the plan and provision the infrastructure accordingly.

```bash
terraform apply

Do you want to perform these actions?

  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: yes
# ...

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

### 6b. [Initialize a Terraform working directory (terraform init)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Initialize%20a%20Terraform%20working%20directory%20(terraform%20init))

The terraform init command initializes a Terraform working directory by setting up the necessary dependencies and configurations for managing infrastructure.

```bash
terraform init [options]
```

### 6c. [Validate a Terraform configuration (terraform validate)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Validate%20a%20Terraform%20configuration%20(terraform%20validate))

The terraform validate command checks the syntax and consistency of Terraform configuration files without accessing remote services, and it can be used as a post-save check in a text editor or as a test step in a CI system. Example: terraform validate -json

```bash
terraform validate [options]
```

### 6d. [Generate and review an execution plan for Terraform (terraform plan)	 ](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Generate%20and%20review%20an%20execution%20plan%20for%20Terraform%20(terraform%20plan))

The terraform plan command in Terraform creates an execution plan to preview changes to infrastructure. It compares the current configuration to the prior state, proposes actions to align them, and helps verify changes before applying them. 

For example, running terraform plan can show you the resources that will be created, modified, or deleted when deploying a new infrastructure stack.

```bash
terraform plan [options]

terraform plan -var 'name=value'

terraform plan -out=FILENAME
```

### 6e. [Execute changes to infrastructure with Terraform (terraform apply)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Execute%20changes%20to%20infrastructure%20with%20Terraform%20(terraform%20apply))

The terraform apply command in Terraform applies the changes proposed in a Terraform plan, either by automatically creating a new plan or by applying a saved plan file. 

For example, running terraform apply can deploy infrastructure resources defined in Terraform configuration files to a cloud provider such as AWS, Azure, or GCP.

```bash
terraform apply [options] [plan file]

```

### 6f. [Destroy Terraform managed infrastructure (terraform destroy)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Destroy%20Terraform%20managed%20infrastructure%20(terraform%20destroy))

The terraform destroy command in Terraform is used to conveniently destroy all remote objects managed by a Terraform configuration. It is commonly used to clean up temporary or development infrastructure. 

For example, running terraform destroy can remove cloud resources provisioned by Terraform, such as virtual machines or storage buckets, once they are no longer needed.

```bash
terraform destroy [options]

terraform plan -destroy

```

### 6g. [Apply formatting and style adjustments to a configuration (terraform fmt)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Apply%20formatting%20and%20style%20adjustments%20to%20a%20configuration%20(terraform%20fmt))

The terraform fmt command in Terraform is used to format and style Terraform configuration files to ensure consistency and readability. It applies predefined style conventions and can be used to maintain industry best practices for Terraform code.

For example, running terraform fmt can automatically format configuration files to match a standard style guide, making it easier for teams to collaborate and maintain code quality.

```bash
terraform fmt [options] [DIR]
```

</p>
</details>


# 7. Describe state locking

## Study Guide: Manage state

#### State management:
[State Locking - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/state/locking)

[Protect Sensitive Input Variables - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables#sensitive-values-in-state)

[Sensitive Data in State - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/state/sensitive-data)

[Refresh-Only Mode - documentation](https://developer.hashicorp.com/terraform/cloud-docs/run/modes-and-options#refresh-only-mode)

[Use Refresh-Only Mode to Sync Terraform State - tutorial](https://developer.hashicorp.com/terraform/tutorials/state/refresh)

[Manage Resource Drift - tutorial](https://developer.hashicorp.com/terraform/tutorials/state/resource-drift)

[Manage Resources in Terraform State - tutorial](https://developer.hashicorp.com/terraform/tutorials/state/state-cli)

#### Backend management:
[Command: login - documentation](https://developer.hashicorp.com/terraform/cli/commands/login)

[Log in to Terraform Cloud from the CLI - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-login)

[Backends - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/settings/backends)

[Local backend - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/settings/backends/local)

[Backend configuration - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/settings/backends/configuration)

[Terraform Cloud Configuration - documentation](https://developer.hashicorp.com/terraform/language/settings/terraform-cloud)

[Create a Workspace - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-workspace-create)

[Store Remote State - tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-remote)

[Migrate State to Terraform Cloud - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate#set-up-the-remote-backend)

<details><summary>Review: Describe state locking</summary>
<p>

### 7a. [Describe default local backend	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20default%20local%20backend)

The backends in Terraform determine where state snapshots are stored, allowing for remote collaboration and access to sensitive information while managing infrastructure resources.

The local backend stores state on the local filesystem, locks that state using system APIs, and performs operations locally.

```bash
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

```bash
data "terraform_remote_state" "foo" {
  backend = "local"

  config = {
    path = "${path.module}/../../terraform.tfstate"
  }
}
```

### 7b. [Describe state locking		](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20state%20locking)

State locking in Terraform ensures data integrity by preventing multiple simultaneous writes to the state file, minimizing the risk of corruption. It is an industry best practice to enable state locking for collaborative environments. 

For example, when multiple team members are working on the same infrastructure, state locking prevents conflicts and ensures consistent resource management.

### 7c. [Handle backend and cloud integration authentication methods	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Handle%20backend%20and%20cloud%20integration%20authentication%20methods)

The terraform login command allows users to automatically obtain and securely store API tokens for Terraform Cloud, Terraform Enterprise, or other Terraform services.

```bash
terraform login [hostname]
```

### 7d. [Differentiate remote state back end options](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Differentiate%20remote%20state%20back%20end%20options)

Backends in Terraform determine where state snapshots are stored, enabling remote collaboration and secure management of infrastructure resources.

### 7e. [Manage resource drift and Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Manage%20resource%20drift%20and%20Terraform%20state)

Refresh-Only Mode in Terraform Cloud helps reconcile Terraform state with manually modified cloud resources, ensuring accurate representation without making any changes to the infrastructure.

```bash
terraform plan -refresh-only
# or
terraform apply -refresh-only
```

### 7f. [Describe backend block and cloud integration in configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20backend%20block%20and%20cloud%20integration%20in%20configuration)

#### Backend Block:

- Defines where Terraform state snapshots are stored.
- Enables remote storage for state, allowing multiple team members to work on the same infrastructure.
- Example: Configuring an S3 backend to store the state file in an S3 bucket.

#### Cloud Integration:

- Refers to integrating Terraform with Terraform Cloud, a service provided by HashiCorp.
- Enables management of infrastructure and collaboration using Terraform.
- Provides features like remote state management, workspace management, and collaboration tools.
- Example: Configuring the Terraform Cloud backend to connect to a Terraform Cloud workspace for remote state management and team collaboration.

```bash
terraform {
  cloud {
    organization = "example_corp"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["app"]
    }
  }
}
```

```bash
# Using a backend block

terraform {
  backend "remote" {
    organization = "example_corp"

    workspaces {
      name = "my-app-prod"
    }
  }
}
```

### 7g. [Understand secret management in state files](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Understand%20secret%20management%20in%20state%20files)

- Terraform state files can contain sensitive data, such as passwords or private keys.
- Treat the state file itself as sensitive data if it includes any sensitive information.
- Storing state remotely provides better security, with options for encryption at rest.
- Terraform Cloud and Terraform Enterprise offer additional security features like encryption, access control, and audit logging.
- Use appropriate measures, such as IAM policies and TLS connections, to protect sensitive data in remote state backends.

</p>
</details>

# 8. Read, generate, and modify configuration

## Study Guide: Read and write configuration

[Resources - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/resources)

[Resource Addressing - documentation](https://developer.hashicorp.com/terraform/cli/v1.1.x/state/resource-addressing)

[References Named Values - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/expressions/references)

[Data Sources - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/data-sources)

[Query Data Sources - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/data-sources)

[Create Resource Dependencies - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/dependencies)

[Resource Graph - documentation](https://developer.hashicorp.com/terraform/internals/v1.1.x/graph)

[Target Resources - tutorial](https://developer.hashicorp.com/terraform/tutorials/state/resource-targeting)

[Complex Types - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/expressions/type-constraints#complex-types)

[Built-in Functions - documentation](https://developer.hashicorp.com/terraform/language/v1.1.x/functions)

[Perform Dynamic Operations with Functions - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/functions)

[Create Dynamic Expressions - tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/expressions)

[Inject Secrets into Terraform Using the Vault Provider - tutorial](https://developer.hashicorp.com/terraform/tutorials/secrets/secrets-vault)

[Vault Provider for Terraform - documentation](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)

<details><summary>Review: Read, generate, and modify configuration</summary>
<p>

### 8a. [Demonstrate use of variables and outputs](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Demonstrate%20use%20of%20variables%20and%20outputs)

#### Variables:

- Declare input variables using a variable block in Terraform configuration.
- Customize aspects of modules by setting variable values using CLI options and environment variables.
- Pass values to child modules using the module block.

#### Outputs:

- Declare output values using an output block in Terraform configuration.
- Expose resource attributes or values from modules to be used in other configurations.
- Access child module outputs using module.<MODULE NAME>.<OUTPUT NAME>.
- Use optional arguments like description, sensitive, and depends_on to provide additional information or control the behavior of outputs.

### 8b. [Describe secure secret injection best practice](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20secure%20secret%20injection%20best%20practice)

- Avoid hard-coding secrets directly in Terraform configuration files.
- Use Vault provider for secure secret storage and retrieval.
- Leverage Vault's dynamic secrets to generate short-lived credentials for resources.
- Store secrets in Vault's encrypted storage, ensuring encryption at rest and in transit.
- Implement access controls and policies to restrict who can access and manage secrets.
- Utilize Vault's audit logging to monitor and track secret access.
- Avoid printing or exposing secrets in logs or outputs.
- Regularly rotate secrets and revoke unnecessary access.
- Follow security best practices for securing the Terraform backend where state files are stored.

### 8c. [Understand the use of collection and structural types](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Understand%20the%20use%20of%20collection%20and%20structural%20types)

#### Collection Types:

- Collection types allow multiple values of one type to be grouped together as a single value.
- The three collection types in Terraform are list, map, and set.
- list(...) represents a sequence of values identified by consecutive whole numbers.
- map(...) represents a collection of values where each is identified by a string label.
- set(...) represents a collection of unique values without any secondary identifiers or ordering.

#### Structural Types:

- Structural types allow multiple values of different types to be grouped together as a single value.
- The two structural types in Terraform are object and tuple.
- object(...) represents a collection of named attributes, each with its own type.
- tuple(...) represents a sequence of elements identified by consecutive whole numbers, with each element having its own type.

### 8d. [Create and differentiate resource and data configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Create%20and%20differentiate%20resource%20and%20data%20configuration)

#### Resource Configuration:

- Resource configuration describes the infrastructure objects to be created or managed by Terraform.
- Resource blocks are used to declare resources in the Terraform configuration.
- Each resource block represents a specific infrastructure object, such as virtual networks or compute instances.
- Resource blocks have a specific syntax and can include arguments and attributes.
- Resource blocks define the desired state of the infrastructure and allow Terraform to create, update, or delete the corresponding objects.
- Meta-arguments like depends_on, count, for_each, provider, and lifecycle can be used to customize the behavior of resource blocks.

```bash
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```

#### Data Configuration:

- Data configuration is used to retrieve information from external sources, such as APIs or other Terraform configurations.
- Data sources provide a way to reference and use information defined outside of the current Terraform configuration.
- Data blocks are used to declare data sources in the Terraform configuration.
- Data blocks specify the type of data source and define the query constraints to retrieve the desired information.
- Data sources are read-only and do not create or manage infrastructure objects.
- Data sources can be referenced in other parts of the configuration to access the retrieved data.

```bash
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```

### 8e. [Use resource addressing and resource parameters to connect resources together](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20resource%20addressing%20and%20resource%20parameters%20to%20connect%20resources%20together)

- Resource addressing uses a string called a resource address.
- It consists of a module path and a resource spec.
- Module path identifies a module, and resource spec identifies a specific resource instance within that module.
- Index values can be used for modules and resources with multiple instances.
- Resource addressing connects resources together by specifying dependencies in the Terraform configuration.

```bash
# An address is made up of two parts:
[module path][resource spec]

```

### 8f. [Use HCL and Terraform functions to write configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20HCL%20and%20Terraform%20functions%20to%20write%20configuration)

- Terraform language has built-in functions for transforming and combining values.
- Functions are called using the function name followed by comma-separated arguments.
- User-defined functions are not supported; only built-in functions can be used.
- Documentation provides a list of available functions and examples.
- Functions can be tested using the Terraform expression console or terraform console command.

```bash
> max(5, 12, 9)
12

min([55, 2453, 2]...)
```

### 8g. [Describe built-in dependency management (order of execution based)](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20built%2Din%20dependency%20management%20(order%20of%20execution%20based))

- Terraform's built-in dependency management determines execution order based on the resource graph.
- The graph is built by analyzing the configuration and includes resource nodes, provider configuration nodes, and resource meta-nodes.
- Resources are added to the graph, provisioners are mapped, and explicit dependencies are created.
- Orphan resources (present in state but not in configuration) are handled.
- Providers are mapped, interpolations are parsed, and a root node is created.
- Traversal of the graph follows a depth-first approach with limited parallelism.
- Built-in dependency management ensures correct execution order, consistency, and conflict avoidance.

</p>
</details>

# 9. Understand Terraform Cloud capabilities

## Study Guide: Understand Terraform Cloud

[What is Terraform Cloud? - documentation](https://developer.hashicorp.com/terraform/cloud-docs)

[Terraform Cloud Workflow - documentation](https://developer.hashicorp.com/terraform/cloud-docs/overview#terraform-workflow)

[Terraform Cloud Workspaces - documentation](https://developer.hashicorp.com/terraform/cloud-docs/workspaces)

[Terraform Cloud Get Started Collection - tutorials](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started)

[Manage Versions in Terraform Cloud - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-versions)

[Use Modules from the Registry - tutorial](https://developer.hashicorp.com/terraform/tutorials/modules/module-use)

[Private Registry - documentation](https://developer.hashicorp.com/terraform/cloud-docs/registry)

[Terraform Cloud Teams - documentation](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/teams)

[Manage Permissions in Terraform Cloud - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-permissions)

[Sentinel - documentation](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/sentinel)

[Enforce a Policy - tutorial](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/policy-quickstart)

<details><summary>Review: Understand Terraform Cloud capabilities</summary>
<p>

### 9a. [Explain how Terraform Cloud helps to manage infrastructure](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Explain%20how%20Terraform%20Cloud%20helps%20to%20manage%20infrastructure) 

- Terraform Cloud is an application designed to assist teams in using Terraform for infrastructure provisioning.
- It provides a consistent and reliable environment for running Terraform.
- Shared state and secret data: Terraform Cloud enables easy access to shared state and secure storage for sensitive information.
- Access controls: It offers controls for approving changes to infrastructure, allowing teams to manage permissions and ensure proper governance.
- Private module registry: Terraform Cloud includes a private registry for sharing and managing Terraform modules within the team or organization.
- Policy controls: Detailed policy controls enable governing the contents of Terraform configurations, ensuring compliance and best practices.
- Collaboration and version control integration: Teams can connect Terraform to version control systems, facilitating collaboration and version management.
- Remote state storage: Terraform Cloud securely stores remote state, eliminating the need for local storage.
- Scalability: Paid editions of Terraform Cloud allow adding more users, creating teams, and scaling collaboration efforts.
- Terraform Enterprise: For organizations with advanced security and compliance requirements, Terraform Enterprise offers a self-hosted version with additional features.

### 9b. [Describe how Terraform Cloud enables collaboration and governance](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20how%20Terraform%20Cloud%20enables%20collaboration%20and%20governance)


#### Teams:

- Allows organizing users into teams for efficient collaboration.
- Provides fine-grained access controls and permissions for teams.
- Simplifies managing team membership and roles.

#### Policy Enforcement with Sentinel:

- Enforces policies on Terraform runs to ensure compliance with predefined rules.
- Uses the Sentinel policy language to define policies.
- Enables policy sets to be applied globally or on specific projects and workspaces.
- Supports imports for accessing reusable libraries, external data, and functions.
- Provides useful functions and idioms for writing policies.
- Allows validation of resource attributes and evaluation of multiple conditions.
- Helps maintain governance and security standards throughout the infrastructure lifecycle.

</p>
</details> 
