resource "kubernetes_manifest" "metrics_server_manifest" {
  manifest = provider::kubernetes::manifest_decode_multi(data.http.metrics_server_manifest.response_body)
}
