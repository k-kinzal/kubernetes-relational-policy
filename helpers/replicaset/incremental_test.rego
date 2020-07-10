package kubernetes

test_replicaset {
    replicasets[replicaset] with input as {"apiVersion":"apps/v1","kind":"ReplicaSet","metadata":{"name":"frontend","labels":{"app":"guestbook","tier":"frontend"}},"spec":{"replicas":3,"selector":{"matchLabels":{"tier":"frontend"},"matchExpressions":[{"key":"tier","operator":"In","values":["frontend"]}]},"template":{"metadata":{"labels":{"app":"guestbook","tier":"frontend"}},"spec":{"containers":[{"name":"php-redis","image":"gcr.io/google_samples/gb-frontend:v3","resources":{"requests":{"cpu":"100m","memory":"100Mi"}},"env":[{"name":"GET_HOSTS_FROM","value":"dns"}],"ports":[{"containerPort":80}]}]}}}}
    replicaset.kind == "ReplicaSet"
}