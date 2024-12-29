# resource "kubernetes_manifest" "kafka_debezium_cluster" {
#   depends_on = [
#     kubernetes_namespace.kafka_debezium_cluster,
#     kubernetes_manifest.customresourcedefinition_kafkamirrormaker2s_kafka_strimzi_io
#   ]

#   manifest = {
#     "apiVersion" = "kafka.strimzi.io/v1beta2"
#     "kind"       = "Kafka"
#     "metadata" = {
#       "name"      = "kafka"
#       "namespace" = kubernetes_namespace.kafka_debezium_cluster.metadata[0].name
#     }
#     "spec" = {
#       "entityOperator" = {
#         "topicOperator" = {}
#         "userOperator"  = {}
#       }
#       "kafka" = {
#         "config" = {
#           "default.replication.factor"               = 1
#           "min.insync.replicas"                      = 1
#           "offsets.topic.replication.factor"         = 1
#           "transaction.state.log.min.isr"            = 1
#           "transaction.state.log.replication.factor" = 1
#         }
#         "listeners" = [
#           {
#             "name" = "plain"
#             "port" = 9092
#             "tls"  = false
#             "type" = "internal"
#           },
#           {
#             "authentication" = {
#               "type" = "tls"
#             }
#             "name" = "tls"
#             "port" = 9093
#             "tls"  = true
#             "type" = "internal"
#           },
#           {
#             "name" = "external"
#             "port" = 9094
#             "tls"  = false
#             "type" = "nodeport"
#           },
#         ]
#         "replicas" = 1
#         "storage" = {
#           "type" = "jbod"
#           "volumes" = [
#             {
#               "deleteClaim" = false
#               "id"          = 0
#               "size"        = "8Gi"
#               "type"        = "persistent-claim"
#             },
#           ]
#         }
#       }
#       "zookeeper" = {
#         "replicas" = 1
#         "storage" = {
#           "deleteClaim" = false
#           "size"        = "8Gi"
#           "type"        = "persistent-claim"
#         }
#       }
#     }
#   }
# }
