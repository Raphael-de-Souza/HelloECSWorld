# Hello ECS World!

## Folder tree:
```
main
│   alb.tf                : AWS Load Balancer configuration file
│   albsg.tf              : AWS Load Balancer security group configuration file        
│   cwl.tf                : AWS CloudWatch configuration file
│   ecs.tf                : AWS ECS configuration file
│   ecsautoscaleperf.tf   : AWS ECS auto scaling by performance configuration file
│   ecsautoscaletarget.tf : AWS ECS auto scaling target configuration file
│   ecsautoscaletime.tf   : AWS ECS auto scaling by time configuration file
│   ecssg.tf              : AWS ECS security group configuration file
│   ecstaskdef.tf         : AWS ECS task configuration file
│   ecstasksvc.tf         : AWS ECS task service configuration file        
│   ig.tf                 : AWS Internet Gateway configuration file
│   provider.tf           : terraform provider configuration file
│   rds.tf                : AWS RDS configuration file
│   rdssg.tf              : AWS RDS security group configuration file
│   README.md             : This file
│   role.tf               : AWS roles configuration file
│   routes.tf             : AWS routes configuration file
│   routetable.tf         : AWS route tables configuration file
│   routetableassoc.tf    : AWS route tables associations configuration file
│   subnets.tf            : AWS subnets configuration file
│   terraform.tfvars      : Terraform default variables values file
│   variables.tf          : Terraform variables file
│   vpc.tf                : AWS VPC configuration file
│   vpcendpoints.tf       : AWS Endpoint services configuration file
│
└───conf                        : Folder with configurations
        githubaccess.json       : GitHub credentials configuration file
        helloworldappcbprojectdef.json : HelloWorld APP AWS CodeBuild project configuration file 
```
## Design
- Load Balancer in front and in two zones 
- Four subnets, two per zone, used by ECS to deploy the cluster
- RDS is isolated and in two zones
- Separated securities groups for Load Balancer, ECS Subnets, and RDS subnets
- Auto-scaling based on time: Down to 1 instance every day at 23:00 h
- Auto-scaling based on performance: below 20% of CPU scale-down, above 80% CPU scale-up
- ECS containers are isolated and not reachable externally
- AWS Cloud Watch is used to store the logs 

## Functionality
- Load Balancer only listens to port 80
- ECS manages the containers
- ECS pulls the containers from ECR when need to deploy new instances
- ECS uses VPC endpoints to communicate with AWS services

## To start the project:
```
1º Configure your credentials to be able to connect to AWS (e.g.: `$ aws configure`).
2º Initialize terraform (e.g.: `$ terraform init`).
3º Inside the terraform folder, create a workspace (e.g.: `$ terraform workspace select HelloECSWorld`).
4º Deploy the IaC to AWS (e.g.: `$ terraform apply`).
```
## Next steps for improvement:
Finalize the configuration of AWS CodeBuild to automatize the push and deploy process