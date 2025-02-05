resource "aws_eks_cluster" "eks-cluster-workshop-01" {
  name     = "eks-teris"
  role_arn = var.role_arn
  version  = "1.31"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_addon" "zero_vpccni" {
  cluster_name  = aws_eks_cluster.eks-cluster-workshop-01.name
  addon_name    = "vpc-cni"
  addon_version = "v1.18.5-eksbuild.1"
}

resource "aws_eks_addon" "zero_kubeproxy" {
  cluster_name  = aws_eks_cluster.eks-cluster-workshop-01.name
  addon_name    = "kube-proxy"
  addon_version = "v1.31.0-eksbuild.5"
}


resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks-cluster-workshop-01.name
  node_group_name = "node_group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  capacity_type   = "SPOT"

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

}

