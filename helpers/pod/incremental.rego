package kubernetes

pods[pod] {
   resources[resource]
   resource.kind == "Pod"
   pod = resource
}
pods[pod] {
   deployments[deployment]
   pod = deployment.spec.template
}
pods[pod] {
   daemonsets[daemonset]
   pod = daemonset.spec.template
}
pods[pod] {
   statefulsets[statefulset]
   pod = statefulset.spec.template
}
pods[pod] {
   replicasets[replicaset]
   pod = replicaset.spec.template
}