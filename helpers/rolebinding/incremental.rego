package kubernetes

rolebindings[rolebinding] {
   resources[resource]
   resource.kind == "RoleBinding"
   rolebinding = resource
}
