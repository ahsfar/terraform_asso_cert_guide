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

### 3b.	[Describe plugin-based architecture](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20plugin%2Dbased%20architecture)

### 3c.	[Write Terraform configuration using multiple providers](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Write%20Terraform%20configuration%20using%20multiple%20providers)

### 3d.	[Describe how Terraform finds and fetches providers](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20how%20Terraform%20finds%20and%20fetches%20providers)

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

### 4a.	[Describe when to use terraform import to import existing infrastructure into your Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20when%20to%20use%20terraform%20import%20to%20import%20existing%20infrastructure%20into%20your%20Terraform%20state)

### 4b.	[Use terraform state to view Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20terraform%20state%20to%20view%20Terraform%20state)

### 4c.	[Describe when to enable verbose logging and what the outcome/value is](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20when%20to%20enable%20verbose%20logging%20and%20what%20the%20outcome/value%20is)

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
### 5a.	[Contrast and use different module source options including the public Terraform Registry](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Contrast%20and%20use%20different%20module%20source%20options%20including%20the%20public%20Terraform%20Registry)

### 5b.	[Interact with module inputs and outputs](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Interact%20with%20module%20inputs%20and%20outputs)

### 5c.	[Describe variable scope within modules/child modules](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20variable%20scope%20within%20modules/child%20modules)

### 5d.	[Set module version](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=5d-,Set%20module%20version,-Module%20Versions)



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

### 6a. [Describe Terraform workflow ( Write -> Plan -> Create )	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20Terraform%20workflow%20(%20Write%20%2D%3E%20Plan%20%2D%3E%20Create%20))

### 6b. [Initialize a Terraform working directory (terraform init)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Initialize%20a%20Terraform%20working%20directory%20(terraform%20init))

### 6c. [Validate a Terraform configuration (terraform validate)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Validate%20a%20Terraform%20configuration%20(terraform%20validate))

### 6d. [Generate and review an execution plan for Terraform (terraform plan)	 ](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Generate%20and%20review%20an%20execution%20plan%20for%20Terraform%20(terraform%20plan))

### 6e. [Execute changes to infrastructure with Terraform (terraform apply)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Execute%20changes%20to%20infrastructure%20with%20Terraform%20(terraform%20apply))

### 6f. [Destroy Terraform managed infrastructure (terraform destroy)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Destroy%20Terraform%20managed%20infrastructure%20(terraform%20destroy))

### 6g. [Apply formatting and style adjustments to a configuration (terraform fmt)	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Apply%20formatting%20and%20style%20adjustments%20to%20a%20configuration%20(terraform%20fmt))


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
### 7a. [Describe default local backend	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20default%20local%20backend)

### 7b. [Describe state locking		](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20state%20locking)

### 7c. [Handle backend and cloud integration authentication methods	](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Handle%20backend%20and%20cloud%20integration%20authentication%20methods)

### 7d. [Differentiate remote state back end options](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Differentiate%20remote%20state%20back%20end%20options)

### 7e. [Manage resource drift and Terraform state](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Manage%20resource%20drift%20and%20Terraform%20state)

### 7f. [Describe backend block and cloud integration in configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20backend%20block%20and%20cloud%20integration%20in%20configuration)

### 7g. [Understand secret management in state files](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Understand%20secret%20management%20in%20state%20files)

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
### 8a. [Demonstrate use of variables and outputs](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Demonstrate%20use%20of%20variables%20and%20outputs)

### 8b. [Describe secure secret injection best practice](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20secure%20secret%20injection%20best%20practice)

### 8c. [Understand the use of collection and structural types](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Understand%20the%20use%20of%20collection%20and%20structural%20types)

### 8d. [Create and differentiate resource and data configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Create%20and%20differentiate%20resource%20and%20data%20configuration)

### 8e. [Use resource addressing and resource parameters to connect resources together](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20resource%20addressing%20and%20resource%20parameters%20to%20connect%20resources%20together)

### 8f. [Use HCL and Terraform functions to write configuration](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Use%20HCL%20and%20Terraform%20functions%20to%20write%20configuration)

### 8g. [Describe built-in dependency management (order of execution based)](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20built%2Din%20dependency%20management%20(order%20of%20execution%20based))

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

### 9a. [Explain how Terraform Cloud helps to manage infrastructure](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Explain%20how%20Terraform%20Cloud%20helps%20to%20manage%20infrastructure) 

### 9b. [Describe how Terraform Cloud enables collaboration and governance](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003#:~:text=Describe%20how%20Terraform%20Cloud%20enables%20collaboration%20and%20governance)

</p>
</details> 
