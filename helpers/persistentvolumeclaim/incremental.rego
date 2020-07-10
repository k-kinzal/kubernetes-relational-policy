package kubernetes

persistentvolumeclaims[persistentvolumeclaim] {
   resources[resource]
   resource.kind == "PersistentVolumeClaim"
   persistentvolumeclaim = resource
}
