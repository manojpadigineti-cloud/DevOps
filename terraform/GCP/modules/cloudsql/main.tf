resource "google_sql_database_instance" "cloudsql" {
  name             = var.cloudsql_name
  database_version = var.dbversion
  region           = var.region
  root_password = var.user_password

  settings {
    tier = var.tier
    disk_size = 20
  }
}

resource "google_sql_database" "database" {
  name     = var.databasename
  instance = google_sql_database_instance.cloudsql.id
}

resource "google_sql_user" "dbuser" {
  name     = var.dbuser_name
  instance = google_sql_database_instance.cloudsql.id
  password = var.user_password
  host = "%"
}