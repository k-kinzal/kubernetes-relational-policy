package kubernetes

containers[container] {
   pods[pod]
   container = pod.spec.containers[_]
}
