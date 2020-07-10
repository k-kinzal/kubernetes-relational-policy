package kubernetes

get_persistentvolumes(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "PersistentVolume"}
}
