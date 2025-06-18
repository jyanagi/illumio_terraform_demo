resource "illumio-core_rule_set" "tf_k8s_ruleset" {
  name = "TF-RS | K8s - Guestbook"

  scopes {
    label {
      href = illumio-core_label.loc_demo.href
    }

    label {
      href = illumio-core_label.env_production.href
    }

    label {
      href = illumio-core_label.app_guestbook.href
    }
  }
}

resource "illumio-core_rule_set" "tf_k8s_core_ruleset" {
  name = "TF-RS | K8s - Essential Services"

  scopes {
    label {
      href = illumio-core_label.loc_demo.href
    }

    label {
      href = illumio-core_label.env_production.href
    }

    label {
      href = illumio-core_label.app_k3s.href
    }
  }
}
