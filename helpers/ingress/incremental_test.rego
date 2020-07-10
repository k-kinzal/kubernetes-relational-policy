package kubernetes

test_ingress {
    ingresses[ingress] with input as {"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"test-ingress","annotations":{"nginx.ingress.kubernetes.io/rewrite-target":"/"}},"spec":{"rules":[{"http":{"paths":[{"path":"/testpath","backend":{"serviceName":"test","servicePort":80}}]}}]}}
    ingress.kind == "Ingress"
}
