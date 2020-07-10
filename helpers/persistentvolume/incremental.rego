package kubernetes

persistentvolumes[persistentvolume] {
   resources[resource]
   resource.kind == "PersistentVolume"
   persistentvolume = resource
}
