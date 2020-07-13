package rules

import data.kubernetes

# apiVersion: k-kinzal.github.io/v1beta1
# kind: KubernetesRelationalPolicy
# spec:
#   ingress:
#     disableAllRule: false
#     disabledMatchBackendServiceRule: false


config_disable_ingress_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["ingress"]["disableAllRule"] == true
}

config_disable_ingress_match_backend_service_rule {
    kubernetes.resources[resource]
    resource.kind == "KubernetesRelationalPolicy"
    resource["spec"]["ingress"]["disabledMatchBackendServiceRule"] == true
}