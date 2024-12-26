resource "helm_release" "strimzi_kafka_operator" {
  name       = "strimzi-operator"
  repository = "oci://quay.io/strimzi-helm/"
  chart      = "strimzi-kafka-operator"
  version    = "0.45.0"

  namespace        = "strimzi-operator"
  create_namespace = true
}
