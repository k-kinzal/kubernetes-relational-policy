package kubernetes

test_role {
    roles[role] with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"Role","metadata":{"namespace":"default","name":"pod-and-pod-logs-reader"},"rules":[{"apiGroups":[""],"resources":["pods","pods/log"],"verbs":["get","list"]}]}
    role.kind == "Role"
}
