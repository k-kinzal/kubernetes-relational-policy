package kubernetes

statefulsets[statefulset] {
   resources[resource]
   resource.kind == "StatefulSet"
   statefulset = resource
}
