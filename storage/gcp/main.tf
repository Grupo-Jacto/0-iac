# Referenciar aos dados do Projeto
data "google_project" "project" {
  project_id = var.project_id
}

# Cria um bucket no Google Cloud Storage
resource "google_storage_bucket" "bucket-storage" {
  name                        = "sb-${var.project_env}-${var.project_name_base}-${var.storage_name}"
  location                    = var.project_region
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.storage_uniform_access
  force_destroy               = var.storage_force_destroy

  cors {
    origin          = var.storage_cors_origin
    method          = var.storage_cors_method
    response_header = var.storage_cors_header
    max_age_seconds = var.storage_cors_age
  }

  dynamic "website" {
    for_each = var.storage_website ? [1] : []

    content {
      main_page_suffix = var.storage_website_main
      not_found_page   = var.storage_website_error
    }
  }

  labels = merge(
    {
      project     = "${var.project_id}",
      environment = "${var.project_env}",
      iac         = "terraform",
      service     = "storage-bucket"
    },
    var.project_labels
  )

  depends_on = [data.google_project.project]
}

# Define uma regra de acesso público de leitura para o bucket
resource "google_storage_bucket_iam_binding" "bucket-storage-iam" {
  for_each = var.storage_iam_public ? { default : 1 } : {}

  bucket  = google_storage_bucket.bucket-storage.name
  role    = var.storage_iam_role
  members = var.storage_iam_members

  depends_on = [
    data.google_project.project,
    google_storage_bucket.bucket-storage
  ]
}

# Cria uma conta de serviço storage para utilizar nos serviços das APIs
resource "google_service_account" "storage-account" {
  for_each = var.storage_account_create ? { default : 1 } : {}

  account_id   = "storage-account-${data.google_project.project.number}"
  display_name = "Storage Account for API Services"
  description  = "Conta de Serviço Storage com permissão de 'Administrador de Objeto do Storage' para uso das APIs para gerenciar arquivos nos buckets"

  depends_on = [
    data.google_project.project,
    google_storage_bucket.bucket-storage
  ]
}

# Define permissão de Administrador de Objeto do Storage
resource "google_project_iam_member" "storage-account-iam" {
  for_each = (var.storage_account_create || var.storage_account_condition) ? { default : 1 } : {}

  project = data.google_project.project.project_id
  role    = var.storage_account_iam_role
  member  = var.storage_account_create ? google_service_account.storage-account.member : var.storage_account_member

  dynamic "condition" {
    for_each = var.storage_account_condition ? { default : 1 } : {}

    content {
      title       = title(google_storage_bucket.bucket-storage.name)
      description = "Permissão de acesso ao Bucket ${title(google_storage_bucket.bucket-storage.name)}"
      expression  = "resource.name == '${google_storage_bucket.bucket-storage.name}'"
    }
  }

  depends_on = [
    data.google_project.project,
    google_storage_bucket.bucket-storage,
    google_service_account.storage-account
  ]
}

# Cria uma chave para a conta de serviço
resource "google_service_account_key" "storage-account-key" {
  for_each = var.storage_account_create ? { default : 1 } : {}

  service_account_id = google_service_account.storage-account.name
  public_key_type    = var.storage_account_key_public_type
  private_key_type   = var.storage_account_key_private_type

  depends_on = [
    data.google_project.project,
    google_service_account.storage-account,
    google_project_iam_member.storage-account-iam
  ]
}

# Exporta a chave para um arquivo .json
resource "local_file" "storage-account-key-export" {
  for_each = var.storage_account_create ? { default : 1 } : {}

  content  = base64decode(google_service_account_key.storage-account-key.private_key)
  filename = "${path.root}/terraform.${var.project_env}.storage.account.key.json"

  depends_on = [
    data.google_project.project,
    google_service_account_key.storage-account-key
  ]
}
