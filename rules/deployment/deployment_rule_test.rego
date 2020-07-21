package rules

import data.kubernetes

test_deployment_not_match_selector_labels {
    deny[msg] with input as {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"nginx-deployment"},"spec":{"selector":{"matchLabels":{"app":"http"}},"replicas":2,"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2","ports":[{"containerPort":80}]}]}}}}
    msg == "spec.selector in Deployment nginx-deployment does not have a matching pod"
}