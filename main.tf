terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws"{
    region = "ap-southeast-1"
    access_key = "AKIARKBBELQB33RGBGMO"
    secret_key = "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"
}

resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

variable "key_name" {}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
    content = tls_private_key.rsa_4096.private_key_pem
    filename = var.key_name
}

resource "aws_instance" "cloudcrafters_instance" {
  ami           = "ami-0fa377108253bf620"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name

  tags = {
    Name = "cloudcrafters_instance"
  }
}

resource "aws_s3_bucket" "cloudinfra-tfstate-bkt" {
  bucket           = "cloudinfra-tfstate-bkt"
  acl = "private"  
  tags = {
    Name = "Terraform State Bucket"
  }
}
