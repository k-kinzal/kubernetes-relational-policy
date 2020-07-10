package kubernetes

get_ingresses(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "Ingress"}
}

get_backends(ingress) = all_resources {
    all_resources := {r | r = ingress.spec.rules[i].http.paths[j].backend}
}

get_services_match_ingress(ingress) = all_resources {
    backends := get_backends(ingress)
    services := get_services(input)
    all_resources := {r | r := services[i]; services[i].metadata.name == backends[j].serviceName; services[i].spec.ports[k].port == backends[j].servicePort}
}