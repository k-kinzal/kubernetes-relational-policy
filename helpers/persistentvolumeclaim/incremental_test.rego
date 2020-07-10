package kubernetes

test_persistentvolumeclaim {
    persistentvolumeclaims[persistentvolumeclaim] with input as {"apiVersion":"v1","kind":"PersistentVolumeClaim","metadata":{"name":"myclaim"},"spec":{"accessModes":["ReadWriteOnce"],"volumeMode":"Filesystem","resources":{"requests":{"storage":"8Gi"}},"storageClassName":"slow","selector":{"matchLabels":{"release":"stable"},"matchExpressions":[{"key":"environment","operator":"In","values":["dev"]}]}}}
    persistentvolumeclaim.kind == "PersistentVolumeClaim"
}
