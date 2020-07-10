package rules

import data.kubernetes

deny[msg] {
    kubernetes.ingresses[ingress]
    backend := ingress.spec.rules[_].http.paths[_].backend

    services := kubernetes.get_services_match_ingress(ingress)
    count(services) == 0

    msg := sprintf("%s:%d in %s %s does not have a matching service", [backend.serviceName, backend.servicePort, ingress.kind, ingress.metadata.name])
}
