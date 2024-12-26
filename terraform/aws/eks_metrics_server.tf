resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server/metrics-server"
  version    = "3.12.2"

  namespace = "kube-system"
}
