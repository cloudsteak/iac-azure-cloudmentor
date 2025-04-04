variable "namespace" {
  type        = string
  description = "Namespace where cert-manager will be installed"
  default     = "cert-manager"
}

variable "depends_on_module" {
  description = "Optional module to depend on (like AKS or ingress)"
  default     = null
}
