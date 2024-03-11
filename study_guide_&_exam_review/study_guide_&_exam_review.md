# Study Guide (In Progress)


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

### 1b. [Describe advantages of IaC patterns](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=1a-,Explain%20what%20IaC%20is,-What%20is%20Terraform)

Automation, Consistency, Scalability, Reproducibility, Collaboration, Testing and Validation, Auditing and Compliance, Rapid Deployment & Disaster Recovery

</p>
</details>

# 2. Understand the purpose of Terraform (vs other IaC)

<details><summary>Review: Understand the purpose of Terraform (vs other IaC)</summary>
<p>

### 2a.	Explain multi-cloud and provider-agnostic benefits

Terraform simplifies multi-cloud infrastructure management and orchestration, enabling fault-tolerance and consistent workflows across multiple cloud providers.

### 2b.	Explain the benefits of state

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

### 3a.	Install and version Terraform providers

### 3b.	Describe plugin-based architecture

### 3c.	Write Terraform configuration using multiple providers

### 3d.	Describe how Terraform finds and fetches providers

```bash

```

</p>
</details>

# 4. Use Terraform outside the core workflow

## Study Guide: Learn more subcommands

[Title]()
[Title]()
[Title]()

<details><summary>Review: Use Terraform outside the core workflow</summary>
<p>

```bash

```

### 4a.	Describe when to use terraform import to import existing infrastructure into your Terraform state

### 4b.	Use terraform state to view Terraform state

### 4c.	Describe when to enable verbose logging and what the outcome/value is

</p>
</details>

# 5. Interact with Terraform modules

## Study Guide: Use and create modules

[Title]()
[Title]()
[Title]()

<details><summary>Review: Interact with Terraform modules</summary>
<p>

```bash

```
### 5a.	Contrast and use different module source options including the public Terraform Registry

### 5b.	Interact with module inputs and outputs

### 5c.	Describe variable scope within modules/child modules

### 5d.	Set module version



</p>
</details>

# 6. Use the core Terraform workflow

## Study Guide: Navigate the core workflow

[Title]()
[Title]()
[Title]()

<details><summary>Review: Use the core Terraform workflow</summary>
<p>

```bash

```

### 6a. Describe Terraform workflow ( Write -> Plan -> Create )	

### 6b. Initialize a Terraform working directory (terraform init)	

### 6c. Validate a Terraform configuration (terraform validate)	

### 6d. Generate and review an execution plan for Terraform (terraform plan)	 

### 6e. Execute changes to infrastructure with Terraform (terraform apply)	

### 6f. Destroy Terraform managed infrastructure (terraform destroy)	

### 6g. Apply formatting and style adjustments to a configuration (terraform fmt)	


</p>
</details>


# 7. Describe state locking

## Study Guide: Manage state

[Title]()
[Title]()
[Title]()

<details><summary>Review: Describe state locking</summary>
<p>

```bash

```
### 7a. Describe default local backend	

### 7b. Describe state locking		

### 7c. Handle backend and cloud integration authentication methods	

### 7d. Differentiate remote state back end options

### 7e. Manage resource drift and Terraform state

### 7f. Describe backend block and cloud integration in configuration

### 7g. Understand secret management in state files

</p>
</details>

# 8. Read, generate, and modify configuration

## Study Guide: Read and write configuration

[Title]()
[Title]()
[Title]()

<details><summary>Review: Read, generate, and modify configuration</summary>
<p>

```bash

```
### 8a. 	Demonstrate use of variables and outputs

### 8b. Describe secure secret injection best practice

### 8c. Understand the use of collection and structural types

### 8d. Create and differentiate resource and data configuration

### 8e. Use resource addressing and resource parameters to connect resources together

### 8f. Use HCL and Terraform functions to write configuration

### 8g. 	Describe built-in dependency management (order of execution based)

</p>
</details>

# 9. Understand Terraform Cloud capabilities

## Study Guide: Understand Terraform Cloud

[Title]()
[Title]()
[Title]()

<details><summary>Review: Understand Terraform Cloud capabilities</summary>
<p>

```bash

```

### 9a. Explain how Terraform Cloud helps to manage infrastructure 

### 9b. Describe how Terraform Cloud enables collaboration and governance

</p>
</details> 
