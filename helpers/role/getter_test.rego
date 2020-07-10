package kubernetes

test_get_roles {
    roles := get_roles(input) with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"Role","metadata":{"namespace":"default","name":"pod-and-pod-logs-reader"},"rules":[{"apiGroups":[""],"resources":["pods","pods/log"],"verbs":["get","list"]}]}
    role := roles[_]
    role.kind == "Role"
}