package kubernetes

get_containers(in) = all_resources {
    resources := get_pods(in)
    all_resources := {r | r := resources[i].spec.containers[j]}
}
