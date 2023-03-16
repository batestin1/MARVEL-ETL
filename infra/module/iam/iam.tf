# Crie uma política com acesso total ao S3
resource "aws_iam_policy" "s3_policy" {
  name   = "s3_fullCONTROL_${random_string.random_suffix.result}"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "*"
      }
    ]
  })
}

# Crie uma política com acesso total ao DynamoDB
resource "aws_iam_policy" "dynamodb_policy" {
  name   = "dynamodb_fullCONTROl_${random_string.random_suffix.result}"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "dynamodb:*"
        Resource = "*"
      }
    ]
  })
}

# Crie um papel de execução para a função Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_fullCONTROL_${random_string.random_suffix.result}"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = ["lambda.amazonaws.com","events.amazonaws.com"]
        }
      }
    ]
  })
}

# Anexe as políticas ao papel de execução do Lambda
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.lambda_exec.name
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attachment" {
  policy_arn = aws_iam_policy.dynamodb_policy.arn
  role       = aws_iam_role.lambda_exec.name
}

output "lambda_function_name" {
  value = aws_iam_role.lambda_exec.arn
}

# Gera um sufixo aleatório para ser adicionado aos nomes dos recursos
resource "random_string" "random_suffix" {
  length = 4
  special = false
}
