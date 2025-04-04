resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.14.4" # You can update this to the latest stable if needed
  namespace  = var.namespace
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [var.depends_on_module]
}
