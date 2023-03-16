variable "function_name" {
  type    = string
  default = "marvel_etl_function_new"
}

variable "description" {
  type    = string
  default = "Lambda function para popular um dinamo"
}

variable "runtime" {
  type    = string
  default = "python3.8"
}

variable "handler" {
  type    = string
  default = "lambda.lambda_handler"
}
