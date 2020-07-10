package kubernetes

test_get_ingresses {
    ingresses := get_ingresses(input) with input as {"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"test-ingress","annotations":{"nginx.ingress.kubernetes.io/rewrite-target":"/"}},"spec":{"rules":[{"http":{"paths":[{"path":"/testpath","backend":{"serviceName":"test","servicePort":80}}]}}]}}
    ingress := ingresses[_]
    ingress.kind == "Ingress"
}