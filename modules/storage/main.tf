resource "aws_s3_bucket" "app_bucket_storage" {
  bucket = "${var.project_name}-bucket"
  force_destroy = true
  
  tags = {
    "Name" = "${var.project_name}-bucket"    
  }
}