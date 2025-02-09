resource "helm_release" "olm" {
  name  = "olm"
  chart = "https://github.com/operator-framework/operator-lifecycle-manager/tree/master/deploy/chart"
}
