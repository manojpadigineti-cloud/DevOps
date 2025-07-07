vpc_networks = {
  i27ecommerce = {
    vpc_name = "i27ecommerce"
  }
}

subnets = {
  i27-subnet-1 = {
    subnet_cidr = "10.1.0.0/16"
    subnet_name = "i27-public-subnet-1"
    subnet_region = "us-central1"
  }
  i27-subnet-2 = {
    subnet_cidr = "10.2.0.0/16"
    subnet_name = "i27-public-subnet-2"
    subnet_region = "us-central1"
  }
  i27-subnet-3 = {
  subnet_cidr = "10.3.0.0/16"
  subnet_name = "i27-public-subnet-3"
  subnet_region = "us-central1"
 }
}

public_compute = {
  masterjenkins = {
    image_name = "projects/canvas-voltage-460913-r5/global/images/manoj-workstation"
    machine_type = "e2-standard-2"
    vm_name = "masterjenkins"
    vpc_name = "i27ecommerce"
    zone = "us-central1-a"
    subnet = "i27-public-subnet-1"
  }
  docker = {
    image_name = "projects/canvas-voltage-460913-r5/global/images/manoj-workstation"
    machine_type = "e2-standard-2"
    vm_name = "docker"
    vpc_name = "i27ecommerce"
    zone = "us-central1-b"
    subnet = "i27-public-subnet-2"
  }
  workerjenkins = {
    image_name = "projects/canvas-voltage-460913-r5/global/images/manoj-workstation"
    machine_type = "e2-standard-2"
    vm_name = "workerjenkins"
    vpc_name = "i27ecommerce"
    zone = "us-central1-c"
    subnet = "i27-public-subnet-3"
  }
}

firewalls = {
  firewallone = {
    firewall_name = "i27firewall"
    ports = ["80", "8080", "22", "9000", "6761", "7761", "8761", "9761", "5761", "8132", "7132", "6132", "5132", "3000", "3001", "3002"]
    protocol = "tcp"
    source_cidr_range = ["0.0.0.0/0"]
    vpc_name = "i27ecommerce"
  }
}

cloudsql_name = "ecommerce"
databasename = "product"
dbuser_name = "product"
dbversion = "MYSQL_8_0"
region = "us-central1"
tier = "db-n1-standard-2"