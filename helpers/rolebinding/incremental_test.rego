package kubernetes

test_rolebinding {
    rolebindings[rolebinding] with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"RoleBinding","metadata":{"name":"read-pods","namespace":"default"},"subjects":[{"kind":"User","name":"jane","apiGroup":"rbac.authorization.k8s.io"}],"roleRef":{"kind":"Role","name":"pod-reader","apiGroup":"rbac.authorization.k8s.io"}}
    rolebinding.kind == "RoleBinding"
}
