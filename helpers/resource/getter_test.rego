package kubernetes

test_get_resource {
    resources := get_resources(input) with input as {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}}
    resource := resources[_]
    is_object(resource)
    is_string(resource.kind)
}

test_get_resource_combined {
    resources := get_resources(input) with input as {"deployment.yaml":{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}}}
    resource := resources[_]
    is_object(resource)
    is_string(resource.kind)
}

test_get_resource_combined_helm_template {
    resources := get_resources(input) with input as {"-":[{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}}]}
    resource := resources[_]
    is_object(resource)
    is_string(resource.kind)
}
