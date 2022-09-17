resource "aws_ecs_task_definition" "app" {
  family                   = "apptask-${terraform.workspace}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn

  task_role_arn = aws_iam_role.app_role.arn

  container_definitions = <<START
[
  {
    "name": "${var.container_name}",
    "image": "${var.default_backend_image}",
    "essential": true,
    "portMappings": [
      {
        "protocol": "tcp",
        "containerPort": ${var.container_port},
        "hostPort": ${var.container_port}
      }
    ],
    "environment": [
      {
        "name": "ENABLE_LOGGING",
        "value": "true"
      },
      {
        "name": "PRODUCT",
        "value": "app"
      },
      {
        "name": "ENVIRONMENT",
        "value": "${terraform.workspace}"
      },
      {
        "name": "SERVERHOST",
        "value": "0.0.0.0"
      },
      {
        "name": "SERVERPORT",
        "value": "${var.container_port}"
      },
      {
        "name": "DBUSER",
        "value": "${aws_db_instance.database.username}"
      },
      {
        "name": "DBPWD",
        "value": "${aws_db_instance.database.password}"
      },
      {
        "name": "DBPORT",
        "value": "${aws_db_instance.database.port}"
      },
      {
        "name": "DB",
        "value": "${aws_db_instance.database.tags.Name}"
      },
      {
        "name": "DBHOST",
        "value": "${aws_db_instance.database.address}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/fargate/service/app-${terraform.workspace}",
        "awslogs-region": "${var.aws_region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
START
  
  tags = merge(
    {
      "Name" : "app-ecs-taskdef-${terraform.workspace}"
  }, var.default_tags)
}