variable "aws_region" {
  type = string
  description = "The AWS region to deploy resources into."
}

variable "project_name" {
  type        = string
  description = "A unique name used to identify and tag resources related to this project."
}

variable "instance_id" {
  type = string
  description = "The ID of the virtual machine instance."
}

variable "bucket_id" {
  type = string
  description = "The ID of the storage bucket."
}

variable "vpc_id" {
  type = string
  description = "The ID of the virtual private cloud."
}