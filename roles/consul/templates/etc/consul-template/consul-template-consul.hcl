# {{ ansible_managed }}

vault {
  address = "http://127.0.0.1:8100"
  renew_token = false
  retry {
    # Settings to 0 for unlimited retries.
    attempts = 0
  }
}

template {
  source = "/etc/consul-template/templates/consul/grpc.ctmpl"
  destination = "/opt/consul/tls/grpc.rendered"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart consul || true"
  }
}

template {
  source = "/etc/consul-template/templates/consul/grpc_ca.crt.ctmpl"
  destination = "/opt/consul/tls/grpc_ca.crt"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart consul || true"
  }
}

template {
  source = "/etc/consul-template/templates/consul/internal_rpc.ctmpl"
  destination = "/opt/consul/tls/internal_rpc.rendered"
  create_dest_dirs = false
  error_on_missing_key = true
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart consul || true"
  }
}

template {
  source = "/etc/consul-template/templates/consul/internal_rpc_ca.crt.ctmpl"
  destination = "/opt/consul/tls/internal_rpc_ca.crt"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart consul || true"
  }
}

template {
  source = "/etc/consul-template/templates/consul/00_consul.hcl.ctmpl"
  destination = "/etc/consul.d/00_consul.hcl"
  create_dest_dirs = false
  perms = "0600"
  exec {
    command = "sudo systemctl reload-or-restart consul || true"
  }
}