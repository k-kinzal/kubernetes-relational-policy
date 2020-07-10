package kubernetes

clusterroles[clusterrole] {
   resources[resource]
   resource.kind == "ClusterRole"
   clusterrole = resource
}
