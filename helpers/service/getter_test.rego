package kubernetes

test_get_services {
    services := get_services(input) with input as {"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}}
    service := services[_]
    service.kind == "Service"
}

test_get_pods_match_service {
    in := {"-":[{"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"my-deployment"},"spec":{"selector":{"matchLabels":{"app":"MyApp"}},"replicas":2,"template":{"metadata":{"labels":{"app":"MyApp"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"protocol":"TCP","containerPort":9376}]}]}}}}]}
    services := get_services(input) with input as in
    service := services[_]
    pods := get_pods_match_service(service) with input as in
    count(pods) == 1
}

test_get_pods_match_service_with_use_default_service_protocol {
    in := {"-":[{"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"port":80,"targetPort":9376}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"my-deployment"},"spec":{"selector":{"matchLabels":{"app":"MyApp"}},"replicas":2,"template":{"metadata":{"labels":{"app":"MyApp"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"protocol":"TCP","containerPort":9376}]}]}}}}]}
    services := get_services(input) with input as in
    service := services[_]
    pods := get_pods_match_service(service) with input as in
    count(pods) == 1
}

test_get_pods_match_service_with_use_default_pod_protocol {
    in := {"-":[{"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":9376}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"my-deployment"},"spec":{"selector":{"matchLabels":{"app":"MyApp"}},"replicas":2,"template":{"metadata":{"labels":{"app":"MyApp"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":9376}]}]}}}}]}
    services := get_services(input) with input as in
    service := services[_]
    pods := get_pods_match_service(service) with input as in
    count(pods) == 1
}

test_get_pods_match_service_with_use_default_all_protocol {
    in := {"-":[{"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"port":80,"targetPort":9376}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"my-deployment"},"spec":{"selector":{"matchLabels":{"app":"MyApp"}},"replicas":2,"template":{"metadata":{"labels":{"app":"MyApp"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":9376}]}]}}}}]}
    services := get_services(input) with input as in
    service := services[_]
    pods := get_pods_match_service(service) with input as in
    count(pods) == 1
}
