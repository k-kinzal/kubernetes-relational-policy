package kubernetes

# https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#labelselector-v1-meta
match_label_selector(selector, labels) {
    # match labels
    count([ s | s := selector.matchLabels[label]; selector.matchLabels[label] == labels[label] ]) == count(selector.matchLabels)
    # match expression
    not selector.matchExpressions
}
match_label_selector(selector, labels) {
    # match labels
    count([ s | s := selector.matchLabels[label]; selector.matchLabels[label] == labels[label] ]) == count(selector.matchLabels)
    # match expression
    selector.matchExpressions
    exprs := selector.matchExpressions
    exprs_in := {e | e := exprs[i]; exprs[i].operator == "In"; contains(labels[exprs[i].key], exprs[i].value)}
    exprs_not_in := {e | e := exprs[i]; exprs[i].operator == "NotIn"; not contains(labels[exprs[i].key], exprs[i].value)}
    exprs_exists := {e | e := exprs[i]; exprs[i].operator == "Exists"; labels[exprs[i].key]}
    exprs_dose_not_exists := {e | e := exprs[i]; exprs[i].operator == "DoesNotExist"; not labels[exprs[i].key]}
    count(exprs_in | exprs_not_in | exprs_exists | exprs_dose_not_exists) == count(exprs)
}
