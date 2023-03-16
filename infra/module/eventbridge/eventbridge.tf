module "iam" {
  source = "../iam"
}

module "lambda" {
  source = "../lambda"
}

resource "aws_cloudwatch_event_rule" "trigger_lambda_on_s3_event" {
  name = var.name_event

  event_pattern = jsonencode({
  "source": ["aws.s3"],
  "detail-type": ["Object Created"],
  "detail": {
    "bucket": {
      "name": ["etl-marvel-bucket"]
    }
  }
})
}

resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule      = aws_cloudwatch_event_rule.trigger_lambda_on_s3_event.name
  arn       = module.lambda.lambda_function_arn
  role_arn  = module.iam.lambda_function_name
  target_id = "invoke_lambda"
  input     = ""
}
