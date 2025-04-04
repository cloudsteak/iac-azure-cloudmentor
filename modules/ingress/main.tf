######################################################
#  Helm Release for Ingress Controller
######################################################

resource "helm_release" "ingress_nginx" {
  name             = var.name
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace

  # Note the use of path.root to reference the root of your current Terraform project
  values = [
    templatefile(
      // Go from modules/ingress -> modules -> . -> templates/ingress
      "${path.module}/../../templates/ingress/values.yaml.tpl",
      {
        service_type             = var.service_type
        controller_replica_count = var.controller_replica_count
        extra_annotations        = var.extra_annotations
      }
    )
  ]

  timeout = 300
  wait    = true
}
