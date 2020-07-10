package kubernetes

test_get_podsecuritypolicies {
    podsecuritypolicies := get_podsecuritypolicies(input) with input as {"apiVersion":"policy/v1beta1","kind":"PodSecurityPolicy","metadata":{"name":"example"},"spec":{"privileged":false,"seLinux":{"rule":"RunAsAny"},"supplementalGroups":{"rule":"RunAsAny"},"runAsUser":{"rule":"RunAsAny"},"fsGroup":{"rule":"RunAsAny"},"volumes":["*"]}}
    podsecuritypolicy := podsecuritypolicies[_]
    podsecuritypolicy.kind == "PodSecurityPolicy"
}