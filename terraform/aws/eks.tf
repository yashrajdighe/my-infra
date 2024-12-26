module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "common-eks"
  cluster_version = "1.31"

  bootstrap_self_managed_addons = false
  cluster_addons = {
    coredns                = {} # this plugin should be installed once nodes are provisioned
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
    aws-ebs-csi-driver = {
      pod_identity_association = [
        {
          role_arn        = aws_iam_role.aws_ebs_csi_driver_assume_role.arn
          service_account = var.aws_ebs_csi_driver_service_account_name
        }
      ]
    }
  }

  # Optional
  cluster_endpoint_public_access = true
  cluster_endpoint_public_access_cidrs = [
    "103.101.111.206/32"
  ]

  enable_cluster_creator_admin_permissions = false
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
    github_action_ci = {
      principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/IaC"

      policy_associations = {
        github_action_ci = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t2.medium"]

      min_size     = 2
      max_size     = 4
      desired_size = 2
    }
  }

}
