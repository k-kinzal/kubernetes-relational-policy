package kubernetes

daemonsets[daemonset] {
   resources[resource]
   resource.kind == "DaemonSet"
   daemonset = resource
}
