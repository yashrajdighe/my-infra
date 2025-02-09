resource "helm_release" "olm" {
  name       = "olm"
  repository = "https://github.com/operator-framework/operator-lifecycle-manager.git"
  chart      = "deploy/chart"
}
