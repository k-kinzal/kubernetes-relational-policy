package kubernetes

test_get_persistentvolumes {
    persistentvolumes := get_persistentvolumes(input) with input as {"apiVersion":"v1","kind":"PersistentVolume","metadata":{"name":"pv0003"},"spec":{"capacity":{"storage":"5Gi"},"volumeMode":"Filesystem","accessModes":["ReadWriteOnce"],"persistentVolumeReclaimPolicy":"Recycle","storageClassName":"slow","mountOptions":["hard","nfsvers=4.1"],"nfs":{"path":"/tmp","server":"172.17.0.2"}}}
    persistentvolume := persistentvolumes[_]
    persistentvolume.kind == "PersistentVolume"
}