package kubernetes

get_ingresses(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "Ingress"}
}
