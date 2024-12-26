resource "kubernetes_manifest" "metrics_server_manifest" {
  manifest = yamldecode(file(var.metrics_server_manifest_url))
}
