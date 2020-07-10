package kubernetes

podsecuritypolicies[podsecuritypolicy] {
   resources[resource]
   resource.kind == "PodSecurityPolicy"
   podsecuritypolicy = resource
}
