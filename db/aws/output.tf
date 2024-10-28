output "db" {
  value = {
    db_name = aws_db_instance.db.db_name
    db_storage = aws_db_instance.db.allocated_storage
    db_engine = aws_db_instance.db.engine
    db_engine_version = aws_db_instance.db.engine_version
    db_availability_zone = aws_db_instance.db.availability_zone
    db_instance_class = aws_db_instance.db.instance_class
    db_username = aws_db_instance.db.username
    db_parameter_group = aws_db_instance.db.parameter_group_name
    db_backup_retention_period = aws_db_instance.db.backup_retention_period
    db_subnet_group_name = aws_db_instance.db.db_subnet_group_name
    db_multi_az = aws_db_instance.db.multi_az
    db_storage_encrypted = aws_db_instance.db.storage_encrypted
    db_timeout_create_action = aws_db_instance.db.timeouts.create
    db_timeout_delete_action = aws_db_instance.db.timeouts.delete
    db_timeout_update_action = aws_db_instance.db.timeouts.update
  }
  description = "Dados - Banco de dados(RDS)"
}

output "db_cluster" {
  value = {
    db_cluster_name = aws_rds_cluster.db_cluster.cluster_identifier
    db_cluster_engine = aws_rds_cluster.db_cluster.engine
    db_cluster_engine_version = aws_rds_cluster.db_cluster.engine_version
    db_cluster_availability_zones = aws_rds_cluster.db_cluster.availability_zones
    db_cluster_database_name = aws_rds_cluster.db_cluster.database_name
    db_cluster_username = aws_rds_cluster.db_cluster.master_username
    db_cluster_backup_retention_period = aws_rds_cluster.db_cluster.backup_retention_period
    db_cluster_preferred_backup_window = aws_rds_cluster.db_cluster.preferred_backup_window
  }
  description = "Dados - Cluster banco de dados(RDS Cluster)"
}

output "db_parameter_group" {
  value = var.db_resource_type == "db" ? {
    pg_name = aws_db_parameter_group.parameter_group.name
    pg_family = aws_db_parameter_group.parameter_group.family
  } : {
    pg_name = aws_rds_cluster.db_cluster.db_cluster_parameter_group_name
    pg_family = aws_db_parameter_group.parameter_group.family
  }
  description = "Dados - Grupo de parametros do banco de dados"
}

output "db_name" {
  value = var.db_resource_type == "db" ?{
    name         = aws_db_instance.db.db_name
  } : {
    name = aws_rds_cluster.db_cluster.cluster_identifier
  }
  description = "Nome da instancia do banco de dados"
}

output "db_engine" {
  value = var.db_resource_type == "db" ? {
    engine = aws_db_instance.db.engine
    engine_version = aws_db_instance.db.engine_version
  } : {
    engine = aws_rds_cluster.parameter_group.engine
    engine_version = aws_rds_cluster.db_cluster.engine_version
  }
  description = "Engine do banco de dados"
}

output "db_availability_zone(s)" {
  value = var.db_resource_type == "db" ? {
    availability_zones = aws_db_instance.db.availability_zone
  } : {
    availability_zones = aws_rds_cluster.db_cluster.availability_zones
  }
  description = "Zonas de disponibilidade do banco de dados"
}

output "db_allocated_storage" {
  value = var.db_resource_type == "db" ? {
    allocated_storage = aws_db_instance.db.allocated_storage
  } : {
    allocated_storage = aws_rds_cluster.db_cluster.allocated_storage
  }
  description = "Espaço em disco alocado para o banco de dados"
}
# Ver como fazer com replicas no meu cluster (nao sei como ainda)
output "db_instance_class" {
  value = var.db_resource_type == "db" ? {
    instance_class = aws_db_instance.db.instance_class
  } : {
    instance_class = aws_rds_cluster.db_cluster.??? #Ver como vou fazer isso pra replicas do cluster
  }
  description = "Tipo da instancia do banco de dados"
}

output "db_username" {
  value = var.db_resource_type == "db" ? {
    username = aws_db_instance.db.username
  } : {
    username = aws_rds_cluster.db_cluster.username
  }
  description = "Nome do usuario root do banco de dados"
}

output "db_backup_retention_period" {
  value = var.db_resource_type == "db" ? {
    backup_retention_period = aws_db_instance.db.backup_retention_period
  } : {
    backup_retention_period = aws_rds_cluster.db_cluster.backup_retention_period
  }
  description = "Tempo de retenção de backup do banco de dados"
}

output "db_subnet_group" {
  value = var.db_resource_type == "db" ? {
    db_subnet_group_name = aws_db_instance.db.db_subnet_group_name
  } : {
    db_subnet_group_name = aws_rds_cluster.db_cluster.db_subnet_group_name
  }
  description = "Grupo de subnets do banco de dados"
}

output "db_skip_final_snapshot" {
  value = var.db_resource_type == "db" ? {
    skip_final_snapshot = aws_db_instance.db.skip_final_snapshot
  } : {
    skip_final_snapshot = aws_rds_cluster.db_cluster.skip_final_snapshot
  }
  description = "Pular imagem final do banco de dados"
}