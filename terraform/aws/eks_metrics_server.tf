resource "kubernetes_manifest" "metrics_server_manifest" {
  manifest = yamldecode(data.http.metrics_server_manifest.response_body)
}
