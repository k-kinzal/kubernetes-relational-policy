package kubernetes

test_get_rolebindings {
    rolebindings := get_rolebindings(input) with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"RoleBinding","metadata":{"name":"read-pods","namespace":"default"},"subjects":[{"kind":"User","name":"jane","apiGroup":"rbac.authorization.k8s.io"}],"roleRef":{"kind":"Role","name":"pod-reader","apiGroup":"rbac.authorization.k8s.io"}}
    rolebinding := rolebindings[_]
    rolebinding.kind == "RoleBinding"
}