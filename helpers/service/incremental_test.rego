package kubernetes

test_service {
    services[service] with input as {"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}
    service.kind == "Service"
}
