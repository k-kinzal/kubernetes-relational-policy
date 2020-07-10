package kubernetes

test_get_poddisruptionbudgets {
    poddisruptionbudgets := get_poddisruptionbudgets(input) with input as {"apiVersion":"policy/v1beta1","kind":"PodDisruptionBudget","metadata":{"name":"zk-pdb"},"spec":{"minAvailable":2,"selector":{"matchLabels":{"app":"zookeeper"}}}}
    poddisruptionbudget := poddisruptionbudgets[_]
    poddisruptionbudget.kind == "PodDisruptionBudget"
}