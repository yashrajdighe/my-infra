resource "helm_release" "olm" {
  name  = "olm"
  chart = "https://github.com/operator-framework/operator-lifecycle-manager.git/deploy/chart"
}
