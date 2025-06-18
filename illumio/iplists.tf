data "illumio-core_ip_lists" "default" {
  # all PCE instances define a special default IP list covering all addresses
  name = "Any (0.0.0.0/0 and ::/0)"
  max_results = 1
}

resource "illumio-core_ip_list" "tf_ipl_users" {
  name          = "TF-IPL-VPN Users"
  description   = "VPN Users IP List - Created by Terraform"

  ip_ranges {
    from_ip     = "10.211.0.0/24"
    description = "VPN User network CIDR"
  }

  fqdns {
    fqdn        = "*.zt-demo.com"
    description = "Zero Trust Demo Domain"
  }

  fqdns {
    fqdn        = "*.de.mo"
    description = "Demo Domain"
  }
}

resource "illumio-core_ip_list" "tf_ipl_illumio" {
  name          = "TF-IPL-Illumio"
  description   = "Illumio PCE Cluster IP List - Created by Terraform"

  ip_ranges {
    from_ip     = "10.30.1.1"
    to_ip       = "10.30.1.2"
    description = "Illumio PCE Core Node(s) network range"
  }
  
  ip_ranges {
    from_ip     = "172.16.11.60"
    description = "Illumio PCE VIP"
  }

  fqdns {
    fqdn        = "core*.de.mo"
    description = "Illumio PCE Core Nodes FQDN"
  }

  fqdns {
    fqdn        = "illumio.de.mo"
    description = "Illumio PCE VIP FQDN"
  }
}

resource "illumio-core_ip_list" "tf_ipl_k8s_registry" {
  name          = "TF-IPL-K8s Registry"
  description   = "K8s Registry IP List - Created by Terraform"

  fqdns {
    fqdn        = "*.docker.io"
  }

  fqdns {
    fqdn        = "privateregistry.example.com"
  }
}

resource "illumio-core_ip_list" "tf_ipl_k8s_kubelink" {
  name          = "TF-IPL-illumio-kubelink"
  description   = "Illumio Kubelink IP List - Created by Terraform"

  fqdns {
    fqdn        = "illumio-kubelink-*"
    description = "All Illumio Kubelink Pods"
  }
}

resource "illumio-core_ip_list" "tf_ipl_k8s_storage" {
  name          = "TF-IPL-illumio-storage"
  description   = "Illumio Storage IP List - Created by Terraform"
  
  fqdns {       
    fqdn        = "illumio-storage-*"
    description = "All Illumio Storage Pods"
  }
}

resource "illumio-core_ip_list" "tf_ipl_k8s_pod_nets" {
  name          = "TF-IPL-K8s Pod Networks"
  description   = "K8s Pod Network IP List - Created by Terraform"

  ip_ranges {
    from_ip     = "10.42.0.0/16"
    description = "K8s Pod Network"
  }

  ip_ranges {
    from_ip     = "10.100.0.0/16"
    description = "Alternate K8s Pod Network"
  }
}

resource "illumio-core_ip_list" "tf_ipl_k8s_svc_nets" {
  name          = "TF-IPL-K8s Services Networks"
  description   = "K8s Services Network IP List - Created by Terraform"

  ip_ranges {
    from_ip     = "10.43.0.0/16"
    description = "K8s Pod Network"
  }

  ip_ranges {
    from_ip     = "10.200.0.0/16"
    description = "Alternate K8s Pod Network"
  }
}
