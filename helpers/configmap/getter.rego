package kubernetes

get_configmaps(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "ConfigMap"}
}
