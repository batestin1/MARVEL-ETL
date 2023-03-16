resource "aws_s3_bucket" "marvel_bucket" {
  bucket = var.s3_bucket_name
  
  tags = {
    Environment = var.stage
    Project     = "marvel"
  }
  
  // Adiciona permissões totais
  acl = "private"
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_object" "marvel_bucket" {
  for_each = fileset("${path.module}/../../../dataset", "**/*")
  bucket = aws_s3_bucket.marvel_bucket.id
  key    = each.value
  source = "${path.module}/../../../dataset/${each.value}"
}