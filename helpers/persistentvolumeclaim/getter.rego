package kubernetes

get_persistentvolumeclaims(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "PersistentVolumeClaim"}
}
