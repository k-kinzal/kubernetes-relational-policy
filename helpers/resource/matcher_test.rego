package kubernetes

test_match_label_selector {
    selector := {"matchLabels": {"app":"nginx"}}
    labels := {"app":"nginx"}
    match_label_selector(selector, labels)
}
test_match_label_selector_with_expression {
    selector := {"matchLabels":{"app":"nginx"},"matchExpressions":[{"key": "app", "operator": "In", "value": "gin"},{"key": "app", "operator": "NotIn", "value": "a"},{"key": "app", "operator": "Exists"},{"key": "foo", "operator": "DoesNotExist"}]}
    labels := {"app":"nginx"}
    match_label_selector(selector, labels)

}