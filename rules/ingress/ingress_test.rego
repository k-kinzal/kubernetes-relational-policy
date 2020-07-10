package rules

test_ingress_not_match_service_name {
    deny[msg] with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service-not-match","servicePort":80}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}
    msg == "service-not-match:80 in Ingress ingress does not have a matching service"
}

test_ingress_not_match_service_port {
    deny[msg] with input as {"-":[{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"ingress"},"spec":{"rules":[{"http":{"paths":[{"path":"/path","backend":{"serviceName":"service","servicePort":8080}}]}}]}},{"apiVersion":"v1","kind":"Service","metadata":{"name":"service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}]}
    msg == "service:8080 in Ingress ingress does not have a matching service"
}