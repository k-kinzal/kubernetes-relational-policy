package kubernetes

replicasets[replicaset] {
   resources[resource]
   resource.kind == "ReplicaSet"
   replicaset = resource
}
