package kubernetes

test_get_clusterroles {
    clusterroles := get_clusterroles(input) with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRole","metadata":{"name":"secret-reader"},"rules":[{"apiGroups":[""],"resources":["secrets"],"verbs":["get","watch","list"]}]}
    clusterrole := clusterroles[_]
    clusterrole.kind == "ClusterRole"
}