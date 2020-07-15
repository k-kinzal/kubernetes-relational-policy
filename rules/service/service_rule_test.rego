package rules

test_service_not_match_target_port_pod {
    deny[msg] with input as {"-":[{"apiVersion":"v1","kind":"Service","metadata":{"name":"my-service"},"spec":{"selector":{"app":"MyApp"},"ports":[{"protocol":"TCP","port":80,"targetPort":80}]}},{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"my-deployment"},"spec":{"selector":{"matchLabels":{"app":"MyApp"}},"replicas":2,"template":{"metadata":{"labels":{"app":"MyApp"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":9376}]}]}}}}]}
    msg == "targetPort 80 in Service my-service does not have a matching pod"
}