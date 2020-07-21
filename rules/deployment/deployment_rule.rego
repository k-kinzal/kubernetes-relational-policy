package rules

import data.kubernetes

deny[msg] {
    not config_disable_deployment_rule
    not config_disable_deployment_match_label_selector

    kubernetes.deployments[deployment]

    pods := kubernetes.get_pods_match_deployment(deployment)
    count(pods) == 0

    msg := sprintf("spec.selector in %s %s does not have a matching pod", [deployment.kind, deployment.metadata.name])
}