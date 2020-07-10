package kubernetes

get_daemonsets(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "DaemonSet"}
}
