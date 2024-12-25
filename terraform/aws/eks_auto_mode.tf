module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "common-eks"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true
  cluster_endpoint_public_access_cidrs = [
    "103.101.111.206/32"
  ]

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  access_entries = {
    root_user = {
      principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"

      policy_associations = {
        root_user = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  cluster_addons = {
    aws-ebs-csi-driver = {
      pod_identity_association = [
        {
          role_arn        = aws_iam_role.aws_ebs_csi_driver_assume_role.arn
          service_account = var.aws_ebs_csi_driver_service_account_name
        }
      ]
    }
  }

}
