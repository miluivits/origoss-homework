variable "kubeconfig_path" {
  description = "Path to kubeconfig used by provider"
  type        = string
  default     = "~/.kube/config"
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "miluivits/origoss-homework:latest"
}

variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 2
}

variable "app_label" {
  description = "Application label used as selector"
  type        = string
  default     = "origoss-hw"
}

variable "service_type" {
  description = "Kubernetes Service type to create (ClusterIP|NodePort|LoadBalancer)"
  type        = string
  default     = "NodePort"
}
