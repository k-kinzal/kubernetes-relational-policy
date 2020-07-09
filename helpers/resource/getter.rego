package kubernetes

get_resources(in) = all_resources {
    in["-"]
    all_resources := {r | r = in["-"][i]}
}
get_resources(in) = all_resources {
    not in["-"]
    not in["kind"]
    all_resources := {r | r = in[i]}
}
get_resources(in) = all_resources {
    not in["-"]
    in["kind"]
    all_resources := {in}
}
