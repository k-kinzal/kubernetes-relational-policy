package kubernetes

secrets[secret] {
   resources[resource]
   resource.kind == "Secret"
   secret = resource
}
