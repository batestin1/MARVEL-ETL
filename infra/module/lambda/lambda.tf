module "iam" {
  source = "../iam"
}
# Crie a função Lambda
resource "aws_lambda_function" "my_lambda_function" {
  function_name = var.function_name
  role          = module.iam.lambda_function_name
  handler       = var.handler
  runtime       = var.runtime
  description   = var.description
  filename      = "${path.module}/app/marvel_etl.zip"

  timeout = 900 # 15 minutos
}

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda_function.arn
}