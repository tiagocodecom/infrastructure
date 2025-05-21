terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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

module "network" {
  source            = "./modules/network"
  project_name      = var.project_name
  vpc_cidr_block    = var.network_vpc_cidr_block
  subnet_cidr_block = var.network_subnet_cidr_block
}

module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
}

module "vmachine" {
  source              = "./modules/vmachine"
  project_name        = var.project_name
  ami                 = var.vmachine_ami
  instance_type       = var.vmachine_instance_type
  vpc_id              = module.network.vpc_id
  subnet_id           = module.network.subnet_id
  security_groups_ids = [module.network.security_group_id]
  internet_gateway_id = module.network.internet_gateway_id
}

module "roles" {
  source = "./modules/roles"
}

module "monitoring" {
  source       = "./modules/monitoring"
  aws_region   = var.aws_region
  project_name = var.project_name
  instance_id  = module.vmachine.instance_id
  bucket_id    = module.storage.bucket_id
  vpc_id       = module.network.vpc_id
}