terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.2"
    }
  }
}

provider "aws" {
  alias  = "aws-ireland"
  region = "eu-west-1"
}

resource "aws_dynamodb_table" "dynamodb-table-3" {
  name           = "UserTable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "UserId"
  range_key      = "UserTitle"

  provider = aws.aws-ireland

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "UserTitle"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table-user3"
  }
}