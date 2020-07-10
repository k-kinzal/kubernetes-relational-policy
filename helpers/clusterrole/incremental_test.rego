package kubernetes

test_clusterrole {
    clusterroles[clusterrole] with input as {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRole","metadata":{"name":"secret-reader"},"rules":[{"apiGroups":[""],"resources":["secrets"],"verbs":["get","watch","list"]}]}
    clusterrole.kind == "ClusterRole"
}
