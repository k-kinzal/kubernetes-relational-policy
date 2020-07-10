package kubernetes

test_get_pods {
    pods := get_pods(input) with input as {"-":[{"apiVersion":"v1","kind":"Pod","metadata":{"name":"static-web","labels":{"role":"myrole"}},"spec":{"containers":[{"name":"web","image":"nginx","ports":[{"name":"web","containerPort":80,"protocol":"TCP"}]}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}},{"apiVersion":"apps/v1","kind":"DaemonSet","metadata":{"name":"fluentd-elasticsearch","namespace":"kube-system","labels":{"k8s-app":"fluentd-logging"}},"spec":{"selector":{"matchLabels":{"name":"fluentd-elasticsearch"}},"template":{"metadata":{"labels":{"name":"fluentd-elasticsearch"}},"spec":{"tolerations":[{"key":"node-role.kubernetes.io/master","effect":"NoSchedule"}],"containers":[{"name":"fluentd-elasticsearch","image":"quay.io/fluentd_elasticsearch/fluentd:v2.5.2","resources":{"limits":{"memory":"200Mi"},"requests":{"cpu":"100m","memory":"200Mi"}},"volumeMounts":[{"name":"varlog","mountPath":"/var/log"},{"name":"varlibdockercontainers","mountPath":"/var/lib/docker/containers","readOnly":true}]}],"terminationGracePeriodSeconds":30,"volumes":[{"name":"varlog","hostPath":{"path":"/var/log"}},{"name":"varlibdockercontainers","hostPath":{"path":"/var/lib/docker/containers"}}]}}}},{"apiVersion":"apps/v1","kind":"StatefulSet","metadata":{"name":"web"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"serviceName":"nginx","replicas":3,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"terminationGracePeriodSeconds":10,"containers":[{"name":"nginx","image":"k8s.gcr.io/nginx-slim:0.8","ports":[{"containerPort":80,"name":"web"}],"volumeMounts":[{"name":"www","mountPath":"/usr/share/nginx/html"}]}]}},"volumeClaimTemplates":[{"metadata":{"name":"www"},"spec":{"accessModes":["ReadWriteOnce"],"storageClassName":"my-storage-class","resources":{"requests":{"storage":"1Gi"}}}}]}},{"apiVersion":"apps/v1","kind":"ReplicaSet","metadata":{"name":"frontend","labels":{"app":"guestbook","tier":"frontend"}},"spec":{"replicas":3,"selector":{"matchLabels":{"tier":"frontend"},"matchExpressions":[{"key":"tier","operator":"In","values":["frontend"]}]},"template":{"metadata":{"labels":{"app":"guestbook","tier":"frontend"}},"spec":{"containers":[{"name":"php-redis","image":"gcr.io/google_samples/gb-frontend:v3","resources":{"requests":{"cpu":"100m","memory":"100Mi"}},"env":[{"name":"GET_HOSTS_FROM","value":"dns"}],"ports":[{"containerPort":80}]}]}}}}]}
    count(pods) == 5
}