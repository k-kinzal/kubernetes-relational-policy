package kubernetes

test_get_horizontalpodautoscalers {
    horizontalpodautoscalers := get_horizontalpodautoscalers(input) with input as {"apiVersion":"autoscaling/v2beta2","kind":"HorizontalPodAutoscaler","metadata":{"name":"php-apache"},"spec":{"scaleTargetRef":{"apiVersion":"apps/v1","kind":"Deployment","name":"php-apache"},"minReplicas":1,"maxReplicas":10,"metrics":[{"type":"Resource","resource":{"name":"cpu","target":{"type":"Utilization","averageUtilization":50}}}]},"status":{"observedGeneration":1,"lastScaleTime":"<some-time>","currentReplicas":1,"desiredReplicas":1,"currentMetrics":[{"type":"Resource","resource":{"name":"cpu","current":{"averageUtilization":0,"averageValue":0}}}]}}
    horizontalpodautoscaler := horizontalpodautoscalers[_]
    horizontalpodautoscaler.kind == "HorizontalPodAutoscaler"
}