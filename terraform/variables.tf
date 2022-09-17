variable "aws_region" {
  type    = string
}

variable "vpc_cidr" {
  type = string
}

variable "az_count" {
  type    = number
}

variable "health_check" {
  type = string
}

variable "default_tags" {
  type = map(any)
}

variable "multi_az_db" {
  type    = bool
}

variable "replicas" {
  type = number
}

variable "container_name" {
  type = string
}

variable "ecs_autoscale_min_instances" {
  type = number
}

variable "ecs_autoscale_max_instances" {
  type = number
}

variable "default_backend_image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "db_name" {
  type = string
}

variable "db_instance_name" {
  type = string
}

variable "ecs_as_cpu_low_threshold_per" {
  type = number
}

variable "ecs_as_cpu_high_threshold_per" {
  type = number
}

variable "scale_up_cron" {
  default = "cron(0 11 ? * MON-FRI *)"
}

variable "scale_down_cron" {
  type = string
}

variable "scale_down_min_capacity" {
  type = number
}

variable "scale_down_max_capacity" {
  type = number
}