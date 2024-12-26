variable "aws_ebs_csi_driver_service_account_name" {
  default = "ebs-csi-controller-sa"
  type    = string
}

variable "aws_ebs_csi_driver_role_name" {
  default = "AmazonEBSCSIDriverRole"
  type    = string
}

variable "aws_ebs_csi_driver_policy_arn" {
  default = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  type    = string
}

variable "cluster_name" {
  default = "common-eks"
  type    = string
}

variable "metrics_server_manifest_url" {
  default = "https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml"
  type    = string
}

variable "kafka_namespace" {
  default = "kafka"
  type    = string
}
