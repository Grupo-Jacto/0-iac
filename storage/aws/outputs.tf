output "resource_bucket_name" {
  value = {
    id = aws_s3_bucket.s3_bucket.id
    name = aws_s3_bucket.s3_bucket.name
    url = aws_s3_bucket.s3_bucket.url
    storage_class = aws_s3_bucket.bucket.lifecycle_rule.storage_class
    tags = aws_s3_bucket.s3_bucket.tags
  }
}

output "resource_iam_policy" {
  value = {
    name = aws_iam_policy.name
    policy_action = aws_iam_policy.policy.Statement.Action
    policy_effect = aws_iam_policy.Statement.Effect
    policy_resource = aws_iam_policy.Statement.Resource
    users_atached = aws_iam_user_policy_attachment.user
  }
}
output "s3_id" {
  value = aws_s3_bucket.s3_bucket.id
}
output "s3_region" {
  value = aws_s3_bucket.s3_bucket.region
}
output "s3_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}
output "s3_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}
output "s3_storage_class" {
  value = aws_s3_bucket.s3_bucket.lifecycle_rule.transition.storage_class
}
output "s3_policy" {
  value = aws_iam_policy.grant-s3-access.name
}
output "s3_service_user_name" {
  value = aws_iam_user.service_user.name
}
output "s3_service_user_arn" {
  value = aws_iam_user.service_user.arn
}
output "s3_service_user_key" {
  value = aws_iam_access_key.service_user_key[count.index]
}
output "count_users_atached_on_s3_policy" {
  value = aws_iam_user_policy_attachment.grant-users-access-s3.user[count.index]
}
output "users_with_permission_on_this_s3" {
  value = aws_iam_user_policy_attachment.grant-users-access-s3.user
}