resource "aws_dynamodb_table" "marvel" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.id_attr
    type = "S"
  }
  attribute {
    name = var.image_attr
    type = "S"
  }
  attribute {
    name = var.description_attr
    type = "S"
  }
  attribute {
    name = var.hash_key
    type = "S"
  }
  global_secondary_index {
    name               = "image-index"
    hash_key           = var.image_attr
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "id_-index"
    hash_key           = var.id_attr
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "name-index"
    hash_key           = var.hash_key
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "description-index"
    hash_key           = var.description_attr
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }
}
