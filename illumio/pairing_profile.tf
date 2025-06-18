resource "illumio-core_pairing_profile" "tf_k8s_pp" {
  name                  = "TF-K8s Pairing Profile"
  enabled               = true
  
  enforcement_mode      = "visibility_only" # idle, visibility_only, full, selective
  enforcement_mode_lock = true
 
  allowed_uses_per_key  = "unlimited" # unlimited, or value (1-2147483647)
  key_lifespan          = "unlimited" # unlimited, or value (in seconds)
  
  role_label_lock       = true
  app_label_lock        = true
  env_label_lock        = true
  loc_label_lock        = true

  log_traffic           = false
  log_traffic_lock      = true

  visibility_level      = "flow_summary" # flow_summary, flow_drops, flow_off, enhanced_data_collection
  visibility_level_lock = false

  labels {
    href = illumio-core_label.loc_demo.href
  }
 
  labels {
    href = illumio-core_label.env_production.href
  }

  labels {
    href = illumio-core_label.app_k3s.href
  }

  labels {
    href = illumio-core_label.role_k8s_node.href
  }
}
