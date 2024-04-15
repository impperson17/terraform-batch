virginia:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform apply -var-file virginia.tfvars

ohio:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform apply -var-file ohio.tfvars

california:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform apply -var-file california.tfvars

oregon:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform apply -var-file oregon.tfvars

virginia-destroy:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy -var-file virginia.tfvars

ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy -var-file ohio.tfvars

california-destroy:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform destroy -var-file california.tfvars

oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy -var-file oregon.tfvars
	