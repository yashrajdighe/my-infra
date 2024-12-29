resource "kubernetes_namespace" "kafka_debezium_cluster" {
  metadata {
    name = var.kafka_namespace
  }
}
