variable "aws_ebs_csi_driver_service_account_name" {
  default = "ebs-csi-controller-sa"
  type    = string
}

variable "aws_ebs_csi_driver_role_name" {
  default = "AmazonEBSCSIDriverRole"
  type    = string
}
