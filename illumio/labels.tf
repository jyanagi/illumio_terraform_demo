resource "illumio-core_label" "role_loadbalancer" {
  key   = "role"
  value = "TF-Load Balancer"
}

resource "illumio-core_label" "role_app" {
  key   = "role"
  value = "TF-App"
}

resource "illumio-core_label" "role_database" {
  key   = "role"
  value = "TF-DB"
}

resource "illumio-core_label" "role_frontend" {
  key   = "role"
  value = "TF-Frontend"
}

resource "illumio-core_label" "role_redis_leader" {
  key   = "role"
  value = "TF-Redis Leader"
}

resource "illumio-core_label" "role_redis_follower" {
  key   = "role"
  value = "TF-Redis Follower"
}

resource "illumio-core_label" "role_k8s_node" {
  key   = "role"
  value = "TF-k8s Node"
}

resource "illumio-core_label" "app_k3s" {
  key   = "app"
  value = "TF-k3s"
}

resource "illumio-core_label" "app_guestbook" {
  key   = "app"
  value = "TF-Guestbook"
}

resource "illumio-core_label" "env_production" {
  key   = "env"
  value = "TF-Production"
}

resource "illumio-core_label" "loc_demo" {
  key   = "loc"
  value = "TF-Demo"
}
