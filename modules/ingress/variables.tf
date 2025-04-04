variable "namespace" {
  type        = string
  description = "Kubernetes namespace where ingress will be installed."
  default     = "ingress-nginx"
}

variable "name" {
  type        = string
  description = "Helm release name for the ingress."
  default     = "ingress-nginx"
}

variable "chart_version" {
  type        = string
  description = "Ingress-nginx chart version."
  default     = "4.7.1"
}

variable "create_namespace" {
  type        = bool
  description = "Whether to create the namespace if it doesn't exist."
  default     = true
}

variable "service_type" {
  type        = string
  description = "Service type (e.g. LoadBalancer, NodePort, ClusterIP)."
  default     = "LoadBalancer"
}

variable "controller_replica_count" {
  type        = number
  description = "Number of ingress controller replicas."
  default     = 2
}

variable "extra_annotations" {
  type        = map(string)
  description = "Extra annotations for the ingress controller service."
  default     = {}
}
