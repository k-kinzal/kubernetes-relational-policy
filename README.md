
[![k-kinzal](https://circleci.com/gh/k-kinzal/kubernetes-relational-policy.svg?style=svg)](https://circleci.com/gh/k-kinzal/kubernetes-relational-policy)

# Kubernetes Rlational Policy

KPR validates multiple kubernetes manifests.

## Motivation

The helm chart may generate a wrong manifest with typos and so on when generating a kubernetes manifest.
It's difficult to notice relevant items in advance, especially for `Ingress`, `Service` and `Deployment` ports.

Therefore, KPR creates a rule for an [OPA](https://github.com/open-policy-agent/opa) to verify that the generated manifest is correct.

## Get Started

```
$ conftest pull github.com/k-kinzal/kubernetes-relational-policy/
$ conftest test [your manifest]
# or
$ conftest test --combine [your manifest1] [your manifest2]
# or
$ helm template . | conftest test --combine - 
```