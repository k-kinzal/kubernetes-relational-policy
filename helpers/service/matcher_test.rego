package kubernetes

test_match_service_selector_label {
    services[service] with input as {"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}
    labels := {"app": "MyApp", "chart": "MyApp"}
    match_service_selector_label(service, labels)
}