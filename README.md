<h1 align="center">
  <br>
  <a href="https://www.opstax.com"><img src="https://opstax-assets.s3-eu-west-1.amazonaws.com/logo/png/1-01.png" alt="Opstax Technology" width="200"></a>
  <br>
  aws-terraform-vpc
  <br>
</h1>

<h4 align="center">The code in this repo will deploy a VPC with 2 public subnets, 2 private subnets & the necessary networking components such as route tables, nat gateways etc.</h4>

<p align="center">
  <a href="#architecture">Architecture</a> •
  <a href="#components">Components</a> •
  <a href="#how-to-use">How to Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#feedback">Feedback</a> •
  <a href="#about-us">About Us</a> •
</p>

## Architecture

![screenshot](https://opstax-assets.s3-eu-west-1.amazonaws.com/blog-pics/aws-terraform-vpc-architecture.png)

## Components

* 1 x AWS VPC
* 1 x Internet Gateway
* 2 x Elastic IP Address
* 2 x Managed Nat Gateway
* 2 x Route Table (Public & Private)
* 4 x Subnets (2 Public, 2 Private)


## How To Use

To clone this repo and start deploying resources, you'll need [Git](https://git-scm.com),[Terraform](https://www.terraform.io/downloads.html) and [AWSCLI](https://aws.amazon.com/cli/) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/opstax/aws-terraform-vpc.git

# Go into the repository
$ cd aws-terraform-vpc

# Customise variable file
$ vi infra.tfvars

# Initialise Terraform
$ terraform init

# Run Terraform Plan
$ terraform plan --var-file=infra.tfvars

# Run Terraform apply
$ terraform apply --var-file=infra.tfvars

```

Note: This was created using Terraform v0.13.2. The cloud provider will charge for any resources created by this code. 


## Credits

This code uses the following products/services:

- [Terraform](https://www.terraform.io)
- [AWS](https://aws.amazon.com)


## Feedback

We would love to hear from you so please do send us an email with any feedback, suggestions or even stories about how our code has helped (or not helped). Please email us at <hello@opstax.com>. 

## About Us

We would love to hear from you so please do send us an email with any feedback, suggestions or even stories about how our code has helped (or not helped). Please email us at <hello@opstax.com>. 

---

> [amitmerchant.com](https://www.amitmerchant.com) &nbsp;&middot;&nbsp;
> GitHub [@amitmerchant1990](https://github.com/amitmerchant1990) &nbsp;&middot;&nbsp;
> Twitter [@amit_merchant](https://twitter.com/amit_merchant)
