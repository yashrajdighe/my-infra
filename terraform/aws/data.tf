data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_name
}

data "http" "metrics_server_manifest" {
  url = var.metrics_server_manifest_url
}
