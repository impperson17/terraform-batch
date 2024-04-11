# terraform-batch
# I created 4 regions tfvars files  (Ohio, nVirginia, Oregon, Cali)

# region            = "us-west-1"
# key_name          = "Aastion-key"
# ports             = [22, 80, 443]
# availability_zone = "us-west-1b"
# instance_type     = "t2.micro"
# ami_id            = "ami-0b990d3cfca306617"
# counts            = 1 

# terraform apply -var-file="cali.tfvars"
# terraform destroy -var-file="cali.tfvars"
