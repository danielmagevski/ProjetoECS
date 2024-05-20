resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "ECS-Dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ECS", "CPUUtilization", "ClusterName", "${aws_ecs_cluster.my_ecs_cluster.name}", "ServiceName", "${aws_ecs_service.app_service.name}"],
          ["...", "MemoryUtilization"]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "title": "CPU and Memory Utilization"
      }
    }
  ]
}
EOF
}


resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/${aws_ecs_cluster.my_ecs_cluster.name}/app"
  retention_in_days = 30
}