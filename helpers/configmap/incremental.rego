package kubernetes

configmaps[configmap] {
   resources[resource]
   resource.kind == "ConfigMap"
   configmap = resource
}
