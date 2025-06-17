resource "illumio-core_security_rule" "tf_k8s_rule0" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["virtual_services"]
  }

  consumers {
    #actors = "ams"  # special notation meaning "all managed systems" - affects all workloads
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

  providers {
    #actors = "ams"
    label {
      href = illumio-core_label.role_redis_leader.href
    }
  }
/*
  ingress_services {

    # Uncomment if using 'All Services'    
    #href = one(data.illumio-core_services.all_services.items[*].href)
    href = illumio-core_service.tf_svc_redis.href
  }
*/
}

resource "illumio-core_security_rule" "tf_k8s_rule_1" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_users.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_http.href
  }
}

resource "illumio-core_security_rule" "tf_k8s_rule2" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_redis_leader.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_redis.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule3" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  # Extra-Ruleset
  unscoped_consumers = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }
  
  consumers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_http.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule4" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["virtual_services"]
  }

  consumers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_redis_leader.href
    }
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule5" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["virtual_services"]
  }

  consumers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule6" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_redis_leader.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_redis.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule7" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_frontend.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_redis.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule8" {
  rule_set_href = illumio-core_rule_set.tf_k8s_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_svc_nets.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_redis.href
  }

}

## K8s Core Services Rulesets

resource "illumio-core_security_rule" "tf_k8s_req_rule0" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    actors = "ams"  # special notation meaning "all managed systems" - affects all workloads
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_registry.href
    }
  }

  ingress_services {
    href = one(data.illumio-core_services.all_services.items[*].href)
  }
}

resource "illumio-core_security_rule" "tf_k8s_req_rule1" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_illumio.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_alt_http.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule2" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["virtual_services"]
    providers = ["workloads"]
  }

  consumers {
    actors = "ams"
  }

  providers {
    actors = "ams"
  }

  ingress_services {
    href = one(data.illumio-core_services.all_services.items[*].href)
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule3" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_pod_nets.href
    }
  }

  providers {
    actors = "ams"
  }

  ingress_services {
    href = illumio-core_service.tf_svc_dns.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule4" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    actors = "ams"
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_pod_nets.href
    }
  }

  ingress_services {
    href = one(data.illumio-core_services.all_services.items[*].href)
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule5" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_svc_nets.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_clas.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule6" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = one(data.illumio-core_ip_lists.default.items[*].href)
    }
  }

  providers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_kube_etcd.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule7" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_kubelink.href
    }
  }

  providers {
    actors = "ams"
  }

  ingress_services {
    href = illumio-core_service.tf_svc_etcd.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule8" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    actors = "ams"
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_storage.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_etcd.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule9" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  providers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_kubelink.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_cven.href
  }

}

/*
resource "illumio-core_security_rule" "tf_k8s_req_rule10" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_kubelink.href
    }
  }

  providers {
    labels {
    # Insert Illumio Labels      
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_alt_http.href
  }

}
*/

resource "illumio-core_security_rule" "tf_k8s_req_rule11" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_kubelink.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_http.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule12" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_k8s_pod_nets.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_kube_api.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_req_rule13" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }

  consumers {
    ip_list {
      href = illumio-core_ip_list.tf_ipl_users.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_http.href
  }

}

resource "illumio-core_security_rule" "tf_k8s_rule14" {
  rule_set_href = illumio-core_rule_set.tf_k8s_core_ruleset.href

  enabled = true

  unscoped_consumers = true

  resolve_labels_as {
    consumers = ["workloads"]
    providers = ["workloads"]
  }
  
  consumers {
    label {
      href = illumio-core_label.role_redis_follower.href
    }
  }

  providers {
    label {
      href = illumio-core_label.role_k8s_node.href
    }
  }

  ingress_services {
    href = illumio-core_service.tf_svc_redis.href
  }

}
