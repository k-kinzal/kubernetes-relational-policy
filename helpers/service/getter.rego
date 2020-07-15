package kubernetes

get_services(in) = all_resources {
    resources := get_resources(in)
    all_resources := {r | r = resources[i]; resources[i].kind == "Service"}
}

get_pods_match_service(service) = all_resources {
    ports := {r | r := service.spec.ports[i]}
    pods := get_pods(input)
    # match selector
    match_pods := {r | r := pods[i]; pods[i].metadata.labels[j] == service.spec.selector[k]}
    # match protocol
    match_protocol_pods_a := {r | r := match_pods[i]; match_pods[i].spec.containers[j].ports[k].protocol == ports[l].protocol}
    match_protocol_pods_b := {r |
        port1 := match_pods[i].spec.containers[j].ports[k]
        port2 := ports[l]
        not port1.protocol
        port2.protocol == "TCP"
        r := match_pods[i]
    }
    match_protocol_pods_c := {r |
        port1 := match_pods[i].spec.containers[j].ports[k]
        port2 := ports[l]
        port1.protocol == "TCP"
        not port2.protocol
        r := match_pods[i]
    }
    match_protocol_pods_d := {r |
        port1 := match_pods[i].spec.containers[j].ports[k]
        port2 := ports[l]
        not port1.protocol
        not port2.protocol
        r := match_pods[i]
    }
    match_protocol_pods := match_protocol_pods_a | match_protocol_pods_b | match_protocol_pods_c | match_protocol_pods_d
    # match targetPort to containerPort or name
    match_port_name_pods := {r | r := match_protocol_pods[i]; match_protocol_pods[i].spec.containers[j].ports[k].containerPort == ports[l].targetPort}
    match_container_port_pods := {r | r := match_protocol_pods[i]; match_protocol_pods[i].spec.containers[j].ports[k].name == ports[l].targetPort}

    all_resources := match_port_name_pods | match_container_port_pods
}
