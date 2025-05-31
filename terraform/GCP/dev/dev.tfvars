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
    subnet_name = "i27-private-subnet-2"
    subnet_region = "us-central1"
  }
  i27-subnet-3 = {
  subnet_cidr = "10.3.0.0/16"
  subnet_name = "i27-private-subnet-3"
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
  }
  docker = {
    image_name = "projects/canvas-voltage-460913-r5/global/images/manoj-workstation"
    machine_type = "e2-standard-2"
    vm_name = "docker"
    vpc_name = "i27ecommerce"
    zone = "us-central1-b"
  }
  workerjenkins = {
    image_name = "projects/canvas-voltage-460913-r5/global/images/manoj-workstation"
    machine_type = "e2-standard-2"
    vm_name = "workerjenkins"
    vpc_name = "i27ecommerce"
    zone = "us-central1-c"
  }
}



