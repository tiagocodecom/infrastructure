resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project_name}-bucket"
  force_destroy = true
  
  tags = {
    "Name" = "${var.project_name}-bucket"    
  }
}