package kubernetes

poddisruptionbudgets[poddisruptionbudget] {
   resources[resource]
   resource.kind == "PodDisruptionBudget"
   poddisruptionbudget = resource
}
