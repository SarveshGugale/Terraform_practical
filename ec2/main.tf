terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"

  tags = {
      Name = "web_server-${count.index}"
  }
}
