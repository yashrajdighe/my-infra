resource "kubernetes_namespace" "strimzi_kafka_operator" {
  metadata {
    name = var.strimzi_kafka_operator_namespace
  }
}

resource "helm_release" "strimzi_kafka_operator" {
  name       = "strimzi-operator"
  repository = "oci://quay.io/strimzi-helm/"
  chart      = "strimzi-kafka-operator"
  version    = "0.45.0"

  namespace = kubernetes_namespace.strimzi_kafka_operator.metadata[0].name
}
