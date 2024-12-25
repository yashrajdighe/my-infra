module "aws_ebs_csi_driver_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name = var.aws_ebs_csi_driver_role_name

  cluster_service_accounts = {
    "common-eks" = ["kube-system:${var.aws_ebs_csi_driver_service_account_name}"]
  }

  role_policy_arns = {
    AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  }
}

data "aws_iam_policy_document" "aws_ebs_csi_driver_assume_role_document" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "pods.eks.amazonaws.com"
      ]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "aws_ebs_csi_driver_assume_role" {
  name               = var.aws_ebs_csi_driver_role_name
  assume_role_policy = data.aws_iam_policy_document.aws_ebs_csi_driver_assume_role_document.json
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.aws_ebs_csi_driver_assume_role.name
  policy_arn = var.aws_ebs_csi_driver_policy_arn
}
