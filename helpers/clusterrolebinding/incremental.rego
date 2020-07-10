package kubernetes

clusterrolebindings[clusterrolebinding] {
   resources[resource]
   resource.kind == "ClusterRoleBinding"
   clusterrolebinding = resource
}
