terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.5"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }
  }

  backend "s3" {
    bucket = "tiagocode--eun1-az1--x-s3"
    key    = "terraform/backend"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

module "aws_vpc" {
  source            = "./modules/aws_vpc"
  project_name      = var.project_name
  vpc_cidr_block    = var.network_vpc_cidr_block
  subnet_cidr_block = var.network_subnet_cidr_block
}

module "aws_s3" {
  source       = "./modules/aws_s3"
  project_name = var.project_name
}

module "aws_iam" {
  source       = "./modules/aws_iam"
  project_name = var.project_name
}

module "aws_ec2" {
  source              = "./modules/aws_ec2"
  project_name        = var.project_name
  ami                 = var.vmachine_ami
  instance_type       = var.vmachine_instance_type
  instance_profile    = module.aws_iam.codedeploy_ec2_profile_name
  vpc_id              = module.aws_vpc.vpc_id
  subnet_id           = module.aws_vpc.subnet_id
  security_groups_ids = module.aws_vpc.security_group_ids
  internet_gateway_id = module.aws_vpc.internet_gateway_id
}

module "aws_cloudwatch" {
  source       = "./modules/aws_cloudwatch"
  aws_region   = var.aws_region
  project_name = var.project_name
  vpc_id       = module.aws_vpc.vpc_id
  bucket_id    = module.aws_s3.bucket_id
  instance_id  = module.aws_ec2.instance_id
}

module "aws_codedeploy" {
  source            = "./modules/aws_codedeploy"
  aws_region        = var.aws_region
  project_name      = var.project_name
  instance_name     = module.aws_ec2.instance_name
  deployer_role_arn = module.aws_iam.codedeploy_ec2_role_arn
}

module "cloudflare_dns" {
  source              = "./modules/cloudflare_dns"
  cloudflare_zone_id  = var.cloudflare_zone_id
  project_domain_name = var.project_domain_name
  instance_public_ip  = module.aws_ec2.instance_public_ip
}
