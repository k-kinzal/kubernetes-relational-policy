package kubernetes

test_get_deployments {
    deployments := get_deployments(input) with input as {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}}
    deployment := deployments[_]
    deployment.kind == "Deployment"
}