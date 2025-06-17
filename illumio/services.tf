resource "illumio-core_service" "tf_svc_redis" {
  name        = "S-TF-Redis"
  description = "TCP and UDP Redis Service - Created by Terraform"

  service_ports {
    # Illumio uses the IANA protocol numbers to identify the service proto
    proto = "6"  # TCP
    port  = "6379"
  }

  service_ports {
    proto = "17"  # UDP
    port  = "6379"
  }
}

resource "illumio-core_service" "tf_svc_http" {
  name        = "S-TF-HTTP(S)"
  description = "HTTP and HTTPS Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "80"
  }

  service_ports {
    proto = "6"
    port  = "443"
  }
}

resource "illumio-core_service" "tf_svc_alt_http" {
  name        = "S-TF-Alt-HTTP(S)"
  description = "Alternative HTTP and HTTPS Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "8080"
  }

  service_ports {
    proto = "6"
    port  = "8443"
  }
}

resource "illumio-core_service" "tf_svc_dns" {
  name        = "S-TF-DNS"
  description = "DNS Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "53"
  }

  service_ports {
    proto = "17"
    port  = "53"
  }
}

resource "illumio-core_service" "tf_svc_kube_api" {
  name        = "S-TF-Kube API"
  description = "TCP 6443 - Kube API Service - Created by Terraform"

  service_ports {
    proto = "6"  
    port  = "6443"
  }
}

resource "illumio-core_service" "tf_svc_kube_etcd" {
  name        = "S-TF-Kube etcd"
  description = "DNS Service - Created by Terraform"

  service_ports {
    proto   = "6"
    port    = "2379"
    to_port = "2380"
  }

  service_ports {
    proto   = "17"
    port    = "2379"
    to_port = "2380"
  }
}

resource "illumio-core_service" "tf_svc_clas" {
  name        = "S-TF-CLAS"
  description = "CLAS Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "9000"
  }
}

resource "illumio-core_service" "tf_svc_etcd" {
  name        = "S-TF-ETCD"
  description = "etcd Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "2379"
  }
}

resource "illumio-core_service" "tf_svc_cven" {
  name        = "S-TF-CVEN"
  description = "CVEN Service - Created by Terraform"

  service_ports {
    proto = "6"
    port  = "8080"
  }

  service_ports {
    proto = "6"
    port  = "8081"
  }
  
  service_ports {
    proto = "6"
    port = "9000"
  }
}

data "illumio-core_services" "all_services" {
  name = "All Services"
  max_results = 1
}
