output "resource_storage_name" {
  value = {
    id = aws_s3_bucket.storage.id
    name = aws_s3_bucket.storage.name
    url = aws_s3_bucket.storage.url
    storage_class = aws_s3_bucket.storage.lifecycle_rule.storage_class
    tags = aws_s3_bucket.storage.tags
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
output "storage_id" {
  value = aws_s3_bucket.storage.id
}
output "storage_region" {
  value = aws_s3_bucket.storage.region
}
output "storage_name" {
  value = aws_s3_bucket.storage.bucket
}
output "storage_arn" {
  value = aws_s3_bucket.storage.arn
}
output "storage_object_class" {
  value = aws_s3_bucket.storage.lifecycle_rule.transition.storage_class
}
output "storage_policy" {
  value = aws_iam_policy.grant-storage-access.name
}
output "storage_service_user_name" {
  value = aws_iam_user.service_user.name
}
output "iam_storage_service_user_arn" {
  value = aws_iam_user.service_user.arn
}
output "iam_storage_service_user_key" {
  value = aws_iam_access_key.service_user_key[count.index]
}
output "count_users_atached_on_storage_policy" {
  value = aws_iam_user_policy_attachment.grant-users-access-storage.user[count.index]
}
output "users_with_permission_on_this_storage" {
  value = aws_iam_user_policy_attachment.grant-users-access-storage.user
}