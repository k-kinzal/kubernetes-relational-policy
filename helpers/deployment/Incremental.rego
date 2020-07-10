package kubernetes

deployments[deployment] {
   resources[resource]
   resource.kind == "Deployment"
   deployment = resource
}
