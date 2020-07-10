# Introduction to Terraform

Xavier Alvarez & Henrik Horeis

07/10/2020
---
## Agenda

* Setup
* Fundamentals
* Deployment
* Modules
---
## Setup
---
## Learnings

* Terraform can work with multiple cloud providers
* Terraform state can be stored safely in a shared location    
---
## Fundamentals

We want to create a managed certificate in AWS.
For this we need to create a certificate and the Route53 DNS validation record.
---
## Learnings

* Data allows us to fetch information from existing resources
* Resources are created by Terraform with cloud provider specific configuration
* Outputs let us reuse and visualize the results of our terraform script
---
## Deployment

@img[Terraform Lifecycle](assets/img/terraform-lifecycle.png) 
---
## Modules

* Modules allow us to reuse infrastructure code in multiple services
* A lot of open source modules exist for use, or you can write your own

Note:
Show terraform module repo:  https://registry.terraform.io/browse/modules
Offical repos: https://registry.terraform.io/modules/terraform-aws-modules
terraform get to download modules
IDEA > vs code
---
## Conclusion

* Cloud provider agnostic
* Easy to get started with
* Great documentation with lots of examples
* Big open source community
---
## Links

* https://www.terraform.io/docs/index.html
* https://registry.terraform.io/
* https://plugins.jetbrains.com/plugin/7808-hashicorp-terraform--hcl-language-support

Note: 
Google terraform resource name
