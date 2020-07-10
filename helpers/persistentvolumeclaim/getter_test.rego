package kubernetes

test_get_persistentvolumeclaims {
    persistentvolumeclaims := get_persistentvolumeclaims(input) with input as {"apiVersion":"v1","kind":"PersistentVolumeClaim","metadata":{"name":"myclaim"},"spec":{"accessModes":["ReadWriteOnce"],"volumeMode":"Filesystem","resources":{"requests":{"storage":"8Gi"}},"storageClassName":"slow","selector":{"matchLabels":{"release":"stable"},"matchExpressions":[{"key":"environment","operator":"In","values":["dev"]}]}}}
    persistentvolumeclaim := persistentvolumeclaims[_]
    persistentvolumeclaim.kind == "PersistentVolumeClaim"
}