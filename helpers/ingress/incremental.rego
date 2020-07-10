package kubernetes

ingresses[ingress] {
   resources[resource]
   resource.kind == "Ingress"
   ingress = resource
}
