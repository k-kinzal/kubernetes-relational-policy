package kubernetes

test_clusterrolebinding {
    clusterrolebindings[clusterrolebinding] with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRoleBinding","metadata":{"name":"read-secrets-global"},"subjects":[{"kind":"Group","name":"manager","apiGroup":"rbac.authorization.k8s.io"}],"roleRef":{"kind":"ClusterRole","name":"secret-reader","apiGroup":"rbac.authorization.k8s.io"}}
    clusterrolebinding.kind == "ClusterRoleBinding"
}
