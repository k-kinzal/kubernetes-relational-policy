package rules

import data.kubernetes

# apiVersion: k-kinzal.github.io/v1beta1
# kind: KubernetesRelationalPolicy
# spec:
#   ingress:
#     disableAllRule: false
#     disableMatchBackendServiceRule: false
#   service:
#     disableAllRule: false
#     disableMatchTargetPortPodRule: false
#   deployment:
#     disableAllRule: false
#     disableMatchLabelSelector: false


config_disable_ingress_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["ingress"]["disableAllRule"] == true
}

config_disable_ingress_match_backend_service_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["ingress"]["disableMatchBackendServiceRule"] == true
}

config_disable_service_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["service"]["disableAllRule"] == true
}

config_disable_service_match_target_port_pod_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["service"]["disableMatchTargetPortPodRule"] == true
}

config_disable_deployment_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["deployment"]["disableAllRule"] == true
}

config_disable_deployment_match_label_selector {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["deployment"]["disableMatchLabelSelector"] == true
}