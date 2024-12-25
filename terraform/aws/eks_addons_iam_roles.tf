module "aws_ebs_csi_driver" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name = var.aws_ebs_csi_driver_role_name

  cluster_service_accounts = {
    "common-eks" = ["kube-system:${var.aws_ebs_csi_driver_service_account_name}"]
  }

  role_policy_arns = {
    AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  }
}
