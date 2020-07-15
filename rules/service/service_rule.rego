package rules

import data.kubernetes

deny[msg] {
    not config_disable_service_rule
    not config_disable_service_match_target_port_pod_rule

    kubernetes.services[service]
    port := service.spec.ports[_]

    pods := kubernetes.get_pods_match_service(service)
    count(pods) == 0

    msg := sprintf("targetPort %v in %s %s does not have a matching pod", [port.targetPort, service.kind, service.metadata.name])
}
