package kubernetes

roles[role] {
   resources[resource]
   resource.kind == "Role"
   role = resource
}
