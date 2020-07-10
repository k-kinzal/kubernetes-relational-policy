package kubernetes

get_pods(in) = all_resources {
    resources := get_resources(in)
    deployments := get_deployments(in)
    daemonsets := get_daemonsets(in)
    statefulsets := get_statefulsets(in)
    replicasets := get_replicasets(in)

    all_resources :=
        {r | r = resources[i]; resources[i].kind == "Pod"}
        | {r | r = deployments[i].spec.template}
        | {r | r = daemonsets[i].spec.template}
        | {r | r = statefulsets[i].spec.template}
        | {r | r = replicasets[i].spec.template}
}
