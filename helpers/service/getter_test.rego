package kubernetes

test_get_services {
    services := get_services(input) with input as {"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}
    service := services[_]
    service.kind == "Service"
}