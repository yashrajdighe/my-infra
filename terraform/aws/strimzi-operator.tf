resource "helm_release" "strimzi-kafka-operator" {
  name       = "my-redis-release"
  repository = "oci://quay.io/strimzi-helm/"
  chart      = "strimzi-kafka-operator"
  version    = "0.45.0"

  namespace        = "strimzi-operator"
  create_namespace = true
}
