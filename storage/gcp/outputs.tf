# Saída de dados do recurso do Bucket Storage
output "resource_bucket_storage" {
  value = {
    _id           = google_storage_bucket.bucket-storage.id
    name          = google_storage_bucket.bucket-storage.name
    url           = google_storage_bucket.bucket-storage.url
    location      = google_storage_bucket.bucket-storage.location
    force_destroy = google_storage_bucket.bucket-storage.force_destroy
    storage_class = google_storage_bucket.bucket-storage.storage_class
    labels        = google_storage_bucket.bucket-storage.terraform_labels
    cors          = google_storage_bucket.bucket-storage.cors
    _project      = google_storage_bucket.bucket-storage.project
    _link         = google_storage_bucket.bucket-storage.self_link
  }
  description = "Dados do recurso do Bucket Storage"
}

# Saída de dados do recurso de Permissão do AllUsers do Bucket Storage
output "resource_bucket_storage_iam" {
  value = {
    _id    = google_storage_bucket_iam_binding.bucket-storage-iam.id
    bucket = google_storage_bucket_iam_binding.bucket-storage-iam.bucket
    role   = google_storage_bucket_iam_binding.bucket-storage-iam.role
  }
  description = "Dados do recurso de Permissão do AllUsers do Bucket Storage"
}

# Saída de dados do recurso para criação de um Service Account para o Storage
output "resource_storage_account" {
  value = {
    _id         = google_service_account.storage-account.id
    name        = google_service_account.storage-account.display_name
    email       = google_service_account.storage-account.email
    member      = google_service_account.storage-account.member
    description = google_service_account.storage-account.description
    disabled    = google_service_account.storage-account.disabled
    _project    = google_service_account.storage-account.project
  }
  description = "Dados do recurso para criação de um Service Account para o Storage"
}

# Saída de dados do recurso de Permissão para a Service Account Storage
output "resource_storage_account_iam" {
  value = {
    _id      = google_project_iam_member.storage-account-iam.id
    bucket   = google_project_iam_member.storage-account-iam.project
    member   = google_project_iam_member.storage-account-iam.member
    role     = google_project_iam_member.storage-account-iam.role
    _project = google_project_iam_member.storage-account-iam.project
  }
  description = "Dados do recurso de Permissão para a Service Account Storage"
}

# Saída de dados do recurso para criar Private e Public Key para a Service Account Storage
output "resource_storage_account_key" {
  value = {
    _id                = google_service_account_key.storage-account-key.id
    service_account_id = google_service_account_key.storage-account-key.service_account_id
    valid_after        = google_service_account_key.storage-account-key.valid_after
    valid_before       = google_service_account_key.storage-account-key.valid_before
  }
  description = "Dados do recurso para criar Private e Public Key para a Service Account Storage"
}

# ID do Storage Bucket
output "storage_id" {
  value       = google_storage_bucket.bucket-storage.id
  description = "ID do Storage Bucket"
}

# Nome do Storage Bucket
output "storage_name" {
  value       = google_storage_bucket.bucket-storage.name
  description = "Nome do Storage Bucket"
}

# URL do Storage Bucket
output "storage_url" {
  value       = google_storage_bucket.bucket-storage.url
  description = "URL do Storage Bucket"
}

# Link do Storage Bucket
output "storage_link" {
  value       = google_storage_bucket.bucket-storage.self_link
  description = "Link do Storage Bucket"
}

# Role do Storage Bucket
output "storage_role" {
  value       = google_storage_bucket_iam_binding.bucket-storage-iam.role
  description = "Role do Storage Bucket"
}

# ID da Service Account
output "storage_account_id" {
  value       = google_service_account.storage-account.id
  description = "ID da Service Account"
}

# Nome da Service Account
output "storage_account_name" {
  value       = google_service_account.storage-account.display_name
  description = "Nome da Service Account"
}

# Email da Service Account
output "storage_account_email" {
  value       = google_service_account.storage-account.email
  description = "Email da Service Account"
}

# Membro da Service Account
output "storage_account_member" {
  value       = google_service_account.storage-account.member
  description = "Membro da Service Account"
}

# Role da Service Account
output "storage_account_role" {
  value = google_project_iam_member.storage-account-iam.role
  description = "Role da Service Account"
}
