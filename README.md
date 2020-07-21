
[![k-kinzal](https://circleci.com/gh/k-kinzal/kubernetes-relational-policy.svg?style=svg)](https://circleci.com/gh/k-kinzal/kubernetes-relational-policy)

# Kubernetes Relational Policy

KPR is an [Open Policy Agent](https://www.openpolicyagent.org/) policies that validates multiple kubernetes manifests.

**NOTE: This is an experimental project. [Please report problems to the issue](https://github.com/k-kinzal/kubernetes-relational-policy/issues).**

## Motivation

When generating a manifest with [helm](https://helm.sh/), [kustomize](https://github.com/kubernetes-sigs/kustomize), etc., there is no way to validate relevant values across multiple manifests.
For example, [kubeval](https://github.com/instrumenta/kubeval) is a great tool, but it can't verify that port values match for `Ingress`, `Service` and `Deployment`.

So KPR uses OPA to define a policies that verifies that the relevant values are correct.

1. KPR only verifies related values
2. KPR validates related values even within the same manifest
3. KPR always assumes that the latest stable kubernetes specification is correct
4. Policies defined in KPR can be partially turned off

## Get Started

```sh
$ conftest pull github.com/k-kinzal/kubernetes-relational-policy/
$ conftest test [your manifest]
# or
$ conftest test --combine [your manifest1] [your manifest2]
# or
$ helm template . | conftest test --combine - 
```

## Disabled policy

In KPR, you can turn off the policy by loading the configuration.

```sh
$ cat <<EOS >config.yaml
apiVersion: k-kinzal.github.io/v1beta1
kind: KubernetesRelationalPolicy
spec:
  ingress:
    disableAllRule: true
    disableMatchBackendServiceRule: false
  service:
    disableAllRule: false
    disableMatchTargetPortPodRule: false
  deployment:
    disableAllRule: false
    disableMatchLabelSelector: false
EOS
$ conftest test --combine config.yaml [your manifest]
```

The latest definition of configuration can be found [here](https://github.com/k-kinzal/kubernetes-relational-policy/blob/master/rules/config.rego).