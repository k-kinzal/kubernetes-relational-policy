package kubernetes

get_deployments(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r := resources[i]; resources[i].kind == "Deployment"}
}

get_pods_match_deployment(deployment) = all_resources {
    pods := {deployment.spec.template}
    all_resources := {r | r := pods[i]; match_label_selector(deployment.spec.selector.matchLabels, pods[i].metadata.labels)}
}

