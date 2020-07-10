package kubernetes

test_podsecuritypolicy {
    podsecuritypolicies[podsecuritypolicy] with input as {"apiVersion":"policy/v1beta1","kind":"PodSecurityPolicy","metadata":{"name":"example"},"spec":{"privileged":false,"seLinux":{"rule":"RunAsAny"},"supplementalGroups":{"rule":"RunAsAny"},"runAsUser":{"rule":"RunAsAny"},"fsGroup":{"rule":"RunAsAny"},"volumes":["*"]}}
    podsecuritypolicy.kind == "PodSecurityPolicy"
}
