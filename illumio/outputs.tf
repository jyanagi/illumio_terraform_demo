output "tf_pce_url" {
  value = var.pce_url
}

output "tf_pce_org_id" {
  value = var.pce_org_id
}

output "tf_pce_api_key" {
  value = var.pce_api_key
}

output "tf_pce_api_secret" {
  value = var.pce_api_secret
  sensitive = true
}

output "tf_k8s_pp" {
  value = illumio-core_pairing_profile.tf_k8s_pp.href
}

/*
output "tf_k8s_pp_key" {
  value = illumio-core_pairing_keys.tf_k8s_pp_key.activation_tokens
}
*/

output "tf_k3s_cc_id" {
  value = illumio-core_container_cluster.tf_k3s_cc.container_cluster_id
}

output "tf_k3s_cc_token" {
  value = illumio-core_container_cluster.tf_k3s_cc.container_cluster_token
  sensitive = true
}

output "tf_label_loc" {
  value = illumio-core_label.loc_demo.href
}

output "tf_label_env" {
  value = illumio-core_label.env_production.href
}

output "tf_label_app" {
  value = illumio-core_label.app_k3s.href
}

output "tf_label_k8s_app" {
  value = illumio-core_label.app_guestbook.href
}
