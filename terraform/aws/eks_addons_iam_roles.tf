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
