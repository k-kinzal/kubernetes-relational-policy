package kubernetes

test_get_ingresses {
    ingresses := get_ingresses(input) with input as {"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"test-ingress","annotations":{"nginx.ingress.kubernetes.io/rewrite-target":"/"}},"spec":{"rules":[{"http":{"paths":[{"path":"/testpath","backend":{"serviceName":"test","servicePort":80}}]}}]}}
    ingress := ingresses[_]
    ingress.kind == "Ingress"
}

test_get_backends {
    ingresses[ingress] with input as {"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"test-ingress","annotations":{"nginx.ingress.kubernetes.io/rewrite-target":"/"}},"spec":{"rules":[{"http":{"paths":[{"path":"/testpath","backend":{"serviceName":"test","servicePort":80}}]}}]}}
    backends := get_backends(ingress)

    count(backends) == 1
}

test_get_services_match_ingress {
    ingresses[ingress] with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}
    services := get_services_match_ingress(ingress) with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}

    count(services) == 1
}

test_get_services_match_ingress_with_multi_service {
    ingresses[ingress] with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path-a","backend":{"serviceName":"service-a","servicePort":80}},{"path":"/path-b","backend":{"serviceName":"service-a","servicePort":443}},{"path":"/path-c","backend":{"serviceName":"service-b","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service-a"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376},{"protocol":"TCP","port":443,"targetPort":9376}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service-b"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}
    services := get_services_match_ingress(ingress) with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path-a","backend":{"serviceName":"service-a","servicePort":80}},{"path":"/path-b","backend":{"serviceName":"service-a","servicePort":443}},{"path":"/path-c","backend":{"serviceName":"service-b","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service-a"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376},{"protocol":"TCP","port":443,"targetPort":9376}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service-b"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}

    count(services) == 2
}

test_get_services_match_ingress_not_match {
    ingresses[ingress] with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service-not-match","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}
    services := get_services_match_ingress(ingress) with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}

    count(services) == 0
}