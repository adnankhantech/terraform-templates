
# --------------- EC2 VARIABLES ---------------
ec2-instance-type = "t2.micro"
ec2-key           = "ec2-demo"
ports             = [22,3000,443,80]
name = "eb-pre-prod-bastion"
ec2-sg-description = "Dev Terraform VM"
ec2-sg-name = "my-first-tf-sg"





