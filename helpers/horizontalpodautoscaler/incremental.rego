package kubernetes

horizontalpodautoscalers[horizontalpodautoscaler] {
   resources[resource]
   resource.kind == "HorizontalPodAutoscaler"
   horizontalpodautoscaler = resource
}
