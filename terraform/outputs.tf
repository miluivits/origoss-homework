output "deployment_name" {
  value = kubernetes_deployment.origoss_hw.metadata[0].name
}

output "service_name" {
  value = kubernetes_service.origoss_hw.metadata[0].name
}

output "service_node_port" {
  value = try(kubernetes_service.origoss_hw.spec[0].port[0].node_port, null)
}
