aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
az_count = 2
health_check = "/"
default_tags = {"company_name" : "HelloWorld!"
                "business_unit" : "IT"
                "support_email" : "it@helloworld.com"}
multi_az_db = true
replicas = "1"
container_name = "app"
ecs_autoscale_min_instances = "1"
ecs_autoscale_max_instances = "8"
default_backend_image = <PATH TO CONTAINER IMAGE IN ECR>
container_port = "8080"
db_name = "dbname"
db_instance_name = "ecsdbinstance"
ecs_as_cpu_low_threshold_per = "20"
ecs_as_cpu_high_threshold_per = "80"
scale_down_cron = "cron(0 23 * * ? *)"
scale_down_min_capacity = 1
scale_down_max_capacity = 8