# stream_security

![Version: 0.1.21](https://img.shields.io/badge/Version-0.1.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.22.0](https://img.shields.io/badge/AppVersion-1.22.0-informational?style=flat-square)

A Helm chart for StreamSec Kubernetes agent

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `nil` |  |
| nameOverride | string | `nil` |  |
| registry | string | `"public.ecr.aws/k6v9y5g3"` |  |
| stream_security.apiToken | string | `nil` | Stream Security API token for your Kubernetes cluster Required: Set your Stream Security API token here ref : |
| stream_security.apiTokenExistingSecret | string | `nil` | Use existing Secret which stores API key instead of creating a new one. The value should be set with the `api-key` key inside the secret. # If set, this parameter takes precedence over "apiToken". |
| stream_security.apiUrl | string | `nil` | Stream Security site url Required: Set your Stream Security API URL here |
| stream_security.clusterRole.create | bool | `true` |  |
| stream_security.clusterRole.name | string | `""` |  |
| stream_security.cost_containers.containers.stream_security-connector.command[0] | string | `"/usr/local/bin/python"` |  |
| stream_security.cost_containers.containers.stream_security-connector.command[1] | string | `"connector.py"` |  |
| stream_security.cost_containers.containers.stream_security-connector.name | string | `"stream_security-connector"` |  |
| stream_security.cost_containers.containers.stream_security-connector.resources.limits.cpu | string | `"2000m"` |  |
| stream_security.cost_containers.containers.stream_security-connector.resources.limits.memory | string | `"2048Mi"` |  |
| stream_security.cost_containers.containers.stream_security-connector.resources.requests.cpu | string | `"800m"` |  |
| stream_security.cost_containers.containers.stream_security-connector.resources.requests.memory | string | `"1024Mi"` |  |
| stream_security.cost_containers.containers.stream_security-cost.command[0] | string | `"/usr/local/bin/python"` |  |
| stream_security.cost_containers.containers.stream_security-cost.command[1] | string | `"cost.py"` |  |
| stream_security.cost_containers.containers.stream_security-cost.name | string | `"stream_security-cost"` |  |
| stream_security.cost_containers.containers.stream_security-cost.resources.limits.cpu | string | `"2000m"` |  |
| stream_security.cost_containers.containers.stream_security-cost.resources.limits.memory | string | `"2048Mi"` |  |
| stream_security.cost_containers.containers.stream_security-cost.resources.requests.cpu | string | `"800m"` |  |
| stream_security.cost_containers.containers.stream_security-cost.resources.requests.memory | string | `"1024Mi"` |  |
| stream_security.cost_containers.enabled | bool | `true` |  |
| stream_security.cost_image.name | string | `"cluster-agent"` | Stream Security cost agent image name. |
| stream_security.cost_image.pullPolicy | string | `"IfNotPresent"` | Stream Security cost agent image pullPolicy |
| stream_security.cost_image.tag | string | `"cost_k8s_process.576"` | Stream Security cost agent tag to use. |
| stream_security.dnsConfig | object | `{}` |  |
| stream_security.env.DEBUG | bool | `false` |  |
| stream_security.env.LOGLEVEL | string | `"INFO"` |  |
| stream_security.equalsLabelSelector | string | `nil` |  |
| stream_security.existLabelSelector | string | `nil` |  |
| stream_security.fieldSelectorsNames | string | `nil` |  |
| stream_security.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |
| stream_security.filterRunningPods | bool | `true` | takes only pods which at status running |
| stream_security.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| stream_security.image.name | string | `"cluster-agent"` | Stream Security agent image name. |
| stream_security.image.pullPolicy | string | `"IfNotPresent"` | Stream Security agent image pullPolicy |
| stream_security.image.tag | string | `"master.575"` | Stream Security agent tag to use. |
| stream_security.inLabelSelector | string | `nil` |  |
| stream_security.port | int | `443` | stream_security port |
| stream_security.process_discovery_containers.containers.stream_security-process-discovery.limits.cpu | string | `"2000m"` |  |
| stream_security.process_discovery_containers.containers.stream_security-process-discovery.limits.memory | string | `"2048Mi"` |  |
| stream_security.process_discovery_containers.containers.stream_security-process-discovery.name | string | `"stream_security-process-discovery"` |  |
| stream_security.process_discovery_containers.containers.stream_security-process-discovery.requests.cpu | string | `"800m"` |  |
| stream_security.process_discovery_containers.containers.stream_security-process-discovery.requests.memory | string | `"1024Mi"` |  |
| stream_security.process_discovery_containers.enabled | bool | `false` |  |
| stream_security.process_discovery_image.name | string | `"process-agent"` | Stream Security process discovery agent image name. |
| stream_security.process_discovery_image.pullPolicy | string | `"IfNotPresent"` | Stream Security process discovery agent image pullPolicy |
| stream_security.process_discovery_image.tag | string | `"master.75"` | Stream Security process discovery agent tag to use. |
| stream_security.replicas | int | `1` |  |
| stream_security.serviceAccount.create | bool | `true` |  |
| stream_security.serviceAccount.name | string | `""` | The name of the Service account. If not set and create is true, a name is generated using the fullname template |
| stream_security.stream_security_containers.containers.stream_security-events.command[0] | string | `"/usr/local/bin/python"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.command[1] | string | `"main.py"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.command[2] | string | `"events"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.enabled | bool | `true` |  |
| stream_security.stream_security_containers.containers.stream_security-events.limits.cpu | string | `"2000m"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.limits.memory | string | `"2048Mi"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.name | string | `"stream_security-events"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.requests.cpu | string | `"800m"` |  |
| stream_security.stream_security_containers.containers.stream_security-events.requests.memory | string | `"1024Mi"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.command[0] | string | `"/usr/local/bin/python"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.command[1] | string | `"main.py"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.command[2] | string | `"krs"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.enabled | bool | `true` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.name | string | `"stream_security-krs"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.resources.limits.cpu | string | `"2000m"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.resources.limits.memory | string | `"4096Mi"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.resources.requests.cpu | string | `"1000m"` |  |
| stream_security.stream_security_containers.containers.stream_security-krs.resources.requests.memory | string | `"2048Mi"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.command[1] | string | `"main.py"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.command[2] | string | `"network_policy"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.enabled | bool | `false` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.limits.cpu | string | `"2000m"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.limits.memory | string | `"2048Mi"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.name | string | `"stream_security-network-policy"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.requests.cpu | string | `"800m"` |  |
| stream_security.stream_security_containers.containers.stream_security-network-policy.requests.memory | string | `"1024Mi"` |  |
| stream_security.stream_security_containers.enabled | bool | `true` |  |
| stream_security.tolerations[0].effect | string | `"NoSchedule"` |  |
| stream_security.tolerations[0].key | string | `"re"` |  |
| stream_security.tolerations[0].operator | string | `"Equal"` |  |
| stream_security.tolerations[0].value | string | `"true"` |  |
| stream_security.workflow | string | `"full_scan"` | stream_security workflow type  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
