resource "aws_s3_bucket" "s3_bucket" {
    bucket = "${var.project_name}-s3-bucket"
    force_destroy = var.force_destroy

    dynamic "lifecycle_rule" {
      for_each = var.s3_lifecycle_rule ? [1] : []
      
      content {
        enabled = var.s3_lifecycle_rule
        transition {
          storage_class = var.transition_storage_class
          days = var.transition_days
        }
        expiration {
          days = var.expiration_days
        }
      }
    }

    cors_rule {
        allowed_headers = var.allowed_headers
        allowed_methods = var.allowed_methods
        allowed_origins = var.allowed_origins
        expose_headers = var.expose_headers
    }

    logging {
      target_bucket = aws_s3_bucket.s3_bucket.bucket
      target_prefix = var.target_prefix
    }

    dynamic "website" {
        for_each = var.s3_website ? [1] : []

        content {
          index_document = var.index
          error_document = var.error_index
        }
    }

    versioning {
      enabled = var.versioning_enabled
    }

  tags = concat({
    Project     = "${var.project_name}"
    Environment = "${var.project_env}"
    iac         = "Terraform"
    service     = "S3"
  },
  var.project_tags)
}

resource "aws_iam_user" "service_user" {
  for_each = var.activate_user_creation ? { default : 1 } : {}

  name = "${var.user_name}-${aws_s3_bucket.s3_bucket.bucket}"

  tags = concat({
    Project     = "${var.project_name}"
    Environment = "${var.project_env}"
    iac         = "Terraform"
    service     = "IAM"
  },
  var.project_tags)
}

resource "aws_iam_access_key" "service_user_key" {
  user = aws_iam_user.service_user.name
}
resource "aws_iam_policy" "grant-s3-access" {
  for_each = var.activate_user_creation ? { default : 1 } : {}

  name        = "access-to-${aws_s3_bucket.s3_bucket.bucket}"
  path        = "/"
  description = "Grant access to s3 ${aws_s3_bucket.s3_bucket.bucket}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          var.iam_policy_action
        ]
        Effect   = var.iam_policy_effect
        Resource = "arn:aws:s3:::${var.aws_account_id}:${aws_s3_bucket.s3_bucket.bucket}/*"
      },
    ]
  })

  tags = concat({
    Project     = "${var.project_name}"
    Environment = "${var.project_env}"
    iac         = "Terraform"
    service     = "IAM"
  },
  var.project_tags)

  depends_on = [ aws_s3_bucket.s3_bucket, aws_iam_user.service_user ]
}

resource "aws_iam_user_policy_attachment" "grant-users-access-s3" {
  user       = concat([aws_iam_user.service-user, [var.users]]) 
  policy_arn = aws_iam_policy.grant-s3-access.arn
}

resource "local_file" "storage-account-key-export" {
  for_each = var.activate_user_creation ? { default : 1 } : {}

  content  = base64decode(aws_iam_access_key.service_user_key.encrypted_secret)
  filename = "${path.root}/terraform.${var.project_env}.s3.service_account.key.json"

  depends_on = [aws_iam_access_key.service_user_key]
}