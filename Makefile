.PHONY: setup
.PHONY: init plan apply destroy
.PHONY: format
.PHONY: access attack

setup:
	cp terraform.tfvars.example terraform.tfvars
	@echo "Please fill in the terraform.tfvars"

init:
	terraform init

plan: init
	terraform plan

apply: init
	terraform apply

destroy: init
	terraform destroy

format:
	terraform fmt -recursive

access:
	@curl "$(DISTRIBUTION_DOMAIN)/index.html"
	@curl -I "$(DISTRIBUTION_DOMAIN)/index.html"

attack:
	@for i in {1..110}; do \
		curl -I "$(DISTRIBUTION_DOMAIN)/index.html" & \
	done
