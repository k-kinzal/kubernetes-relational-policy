package kubernetes

match_service_selector_label(service, labels) {
    count({l | l := service.spec.selector[label]; service.spec.selector[label] == labels[label]}) == count(service.spec.selector)
}