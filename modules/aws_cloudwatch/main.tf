resource "aws_cloudwatch_dashboard" "app_dashboard" {
  dashboard_name = "${var.project_name}-dashboard"
  dashboard_body = jsonencode({
    widgets = [{
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "${var.instance_id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "EC2 ${var.instance_id} - CPU Utilization"
        }
      }, {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 6
        height = 6
        properties = {
          view: "timeSeries",
          metrics: [
              ["AWS/EC2", "EBSWriteOps", "InstanceId", var.instance_id ]
          ],
          region: var.aws_region,
          period: 300,
          stacked: true
          title = "EC2 ${var.instance_id} - EBSWriteOps"
        }
      }, {
        type   = "metric"
        x      = 6
        y      = 6
        width  = 6
        height = 6
        properties = {
          view: "timeSeries",
          metrics: [
              ["AWS/EC2", "EBSReadOps", "InstanceId", var.instance_id ]
          ],
          region: var.aws_region,
          period: 300,
          stacked: true
          title = "EC2 ${var.instance_id} - EBSReadOps"
        }
      }, {
        type   = "metric"
        x      = 0
        y      = 12
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "NetworkIn", "InstanceId", "${var.instance_id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "EC2 ${var.instance_id} - NetworkIn"
        }
      }, {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 6
        height = 6
        properties = {
          view: "singleValue",
          stacked: true,
          metrics: [
              [ "AWS/S3", "NumberOfObjects", "BucketName", var.bucket_id, "StorageType", "AllStorageTypes"]
          ],
          region: var.aws_region
          period: 300
          title: "S3 ${var.bucket_id} - NumberOfObjects"
        }
      },  {
        type   = "metric"
        x      = 18
        y      = 0
        width  = 6
        height = 6
        properties = {
          view: "singleValue",
          stacked: true,
          metrics: [
              [ "AWS/S3", "BucketSizeBytes", "BucketName", var.bucket_id, "StorageType", "AllStorageTypes"]
          ],
          region: var.aws_region
          period: 300
          title: "S3 ${var.bucket_id} - BucketSizeBytes"
        }
      }]
  })
}