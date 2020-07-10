package kubernetes

test_poddisruptionbudget {
    poddisruptionbudgets[poddisruptionbudget] with input as {"apiVersion":"policy/v1beta1","kind":"PodDisruptionBudget","metadata":{"name":"zk-pdb"},"spec":{"minAvailable":2,"selector":{"matchLabels":{"app":"zookeeper"}}}}
    poddisruptionbudget.kind == "PodDisruptionBudget"
}
