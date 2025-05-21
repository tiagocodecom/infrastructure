resource "aws_iam_role" "app_role" {
  name = "${var.project_name}-bucket-access-role"

  assume_role_policy = jsonencode({

  })
}

resource "aws_iam_role_policy" "app_role_policy" {
  name = "${var.project_name}-bucket-access-policy"
  role = aws_iam_role.app_role.id  
  policy = jsonencode({
    
  })
}