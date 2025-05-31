resource "local_file" "private_key" {
  filename = var.local_file_name
  content = var.content
}

