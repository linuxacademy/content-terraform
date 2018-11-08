#provider 
provider "aws" {
   #access_key = "${var.aws_access_key}"
   #secret_key = "${var.aws_secret_key}"
   #aws_profile = "${var.aws_profile}"
   region = "${var.aws_region}"
}

#backend s3
terraform {
  backend "s3" {
    bucket = "terraform-latest-s3-20201214" #this s3 bucket need to be created in aws
    key    = "terraform/terraform.tfstate"  # this folder (terraform) needs to be create under the above bucket
    region = "us-east-2"
  }
}

# Deploy Storage Resource
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
}

# Deploy Networking Resources

module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_subnets         = "${var.public_cidr_sbs}"
  private_subnets         = "${var.private_cidr_sbs}"
  aws_region = "${var.aws_region}"
  cidrs		= "${var.cidrs}"
  localip     = "${var.localip}"
}


# Deploy Compute Resources

module "compute" {
  source          = "./compute"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type   = "${var.instance_type}"
  instance_ami	  = "${var.instance_ami}"
  aws_region            = "${var.aws_region}"
  public_security_group = "${module.networking.public_sg}"
  private_security_group = "${module.networking.dev_sg}"
  public_subnets         = "${module.networking.public_sbs}"
  private_subnets         = "${module.networking.private_sbs}"
  localip		= "${var.localip}"
  cidrs                 = "${var.cidrs}"
  aws_profile		= "${var.aws_profile}"
}
