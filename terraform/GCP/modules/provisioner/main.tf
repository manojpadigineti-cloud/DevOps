resource "null_resource" "provisioner" {
  connection {
    type     = "ssh"
    user     = "docker"
    password = var.ssh_password
    host     = var.remote_host
  }

  provisioner "remote-exec" {
      inline = [
        "git clone https://github.com/manojpadigineti-cloud/DevOps.git",
        "cd /home/devops/DevOps/ansible",
        "ansible-playbook -i localhost playbook.yml -e role=${var.run_server}"
    ]
  }
}
