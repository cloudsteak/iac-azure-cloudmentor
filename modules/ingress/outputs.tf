######################################################
#  Outputs
######################################################
output "ingress_nginx_release_status" {
  description = "Status of the Helm release for ingress-nginx"
  value       = helm_release.ingress_nginx.status
}
