provider "aws" {
  region = var.region
}

module "iam" {
  source = "./module/iam"
}

module "s3" {
  source = "./module/s3"
}

module "dynamodb"{
    source = "./module/dynamodb"
}

module "lambda"{
    source = "./module/lambda"
}

module "eventbridge"{
    source = "./module/eventbridge"
}