package kubernetes

test_get_statefulsets {
    statefulsets := get_statefulsets(input) with input as {"apiVersion":"apps/v1","kind":"StatefulSet","metadata":{"name":"web"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"serviceName":"nginx","replicas":3,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"terminationGracePeriodSeconds":10,"containers":[{"name":"nginx","image":"k8s.gcr.io/nginx-slim:0.8","ports":[{"containerPort":80,"name":"web"}],"volumeMounts":[{"name":"www","mountPath":"/usr/share/nginx/html"}]}]}},"volumeClaimTemplates":[{"metadata":{"name":"www"},"spec":{"accessModes":["ReadWriteOnce"],"storageClassName":"my-storage-class","resources":{"requests":{"storage":"1Gi"}}}}]}}
    statefulset := statefulsets[_]
    statefulset.kind == "StatefulSet"
}