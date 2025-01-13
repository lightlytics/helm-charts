# stream-security

![Version: 0.1.21](https://img.shields.io/badge/Version-0.1.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.22.0](https://img.shields.io/badge/AppVersion-1.22.0-informational?style=flat-square)

A Helm chart for StreamSec Kubernetes agent

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `nil` |  |
| nameOverride | string | `nil` |  |
| registry | string | `"public.ecr.aws/k6v9y5g3"` |  |
| stream-security.apiToken | string | `nil` | Stream Security API token for your Kubernetes cluster Required: Set your Stream Security API token here ref : |
| stream-security.apiTokenExistingSecret | string | `nil` | Use existing Secret which stores API key instead of creating a new one. The value should be set with the `api-key` key inside the secret. # If set, this parameter takes precedence over "apiToken". |
| stream-security.apiUrl | string | `nil` | Stream Security site url Required: Set your Stream Security API URL here |
| stream-security.clusterRole.create | bool | `true` |  |
| stream-security.clusterRole.name | string | `""` |  |
| stream-security.cost_containers.containers.stream-security-connector.command[0] | string | `"/usr/local/bin/python"` |  |
| stream-security.cost_containers.containers.stream-security-connector.command[1] | string | `"connector.py"` |  |
| stream-security.cost_containers.containers.stream-security-connector.name | string | `"stream-security-connector"` |  |
| stream-security.cost_containers.containers.stream-security-connector.resources.limits.cpu | string | `"2000m"` |  |
| stream-security.cost_containers.containers.stream-security-connector.resources.limits.memory | string | `"2048Mi"` |  |
| stream-security.cost_containers.containers.stream-security-connector.resources.requests.cpu | string | `"800m"` |  |
| stream-security.cost_containers.containers.stream-security-connector.resources.requests.memory | string | `"1024Mi"` |  |
| stream-security.cost_containers.containers.stream-security-cost.command[0] | string | `"/usr/local/bin/python"` |  |
| stream-security.cost_containers.containers.stream-security-cost.command[1] | string | `"cost.py"` |  |
| stream-security.cost_containers.containers.stream-security-cost.name | string | `"stream-security-cost"` |  |
| stream-security.cost_containers.containers.stream-security-cost.resources.limits.cpu | string | `"2000m"` |  |
| stream-security.cost_containers.containers.stream-security-cost.resources.limits.memory | string | `"2048Mi"` |  |
| stream-security.cost_containers.containers.stream-security-cost.resources.requests.cpu | string | `"800m"` |  |
| stream-security.cost_containers.containers.stream-security-cost.resources.requests.memory | string | `"1024Mi"` |  |
| stream-security.cost_containers.enabled | bool | `true` |  |
| stream-security.cost_image.name | string | `"cluster-agent"` | Stream Security cost agent image name. |
| stream-security.cost_image.pullPolicy | string | `"IfNotPresent"` | Stream Security cost agent image pullPolicy |
| stream-security.cost_image.tag | string | `"cost_k8s_process.576"` | Stream Security cost agent tag to use. |
| stream-security.dnsConfig | object | `{}` |  |
| stream-security.env.DEBUG | bool | `false` |  |
| stream-security.env.LOGLEVEL | string | `"INFO"` |  |
| stream-security.equalsLabelSelector | string | `nil` |  |
| stream-security.existLabelSelector | string | `nil` |  |
| stream-security.fieldSelectorsNames | string | `nil` |  |
| stream-security.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |
| stream-security.filterRunningPods | bool | `true` | takes only pods which at status running |
| stream-security.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| stream-security.image.name | string | `"cluster-agent"` | Stream Security agent image name. |
| stream-security.image.pullPolicy | string | `"IfNotPresent"` | Stream Security agent image pullPolicy |
| stream-security.image.tag | string | `"master.575"` | Stream Security agent tag to use. |
| stream-security.inLabelSelector | string | `nil` |  |
| stream-security.port | int | `443` | stream-security port |
| stream-security.process_discovery_containers.containers.stream-security-process-discovery.limits.cpu | string | `"2000m"` |  |
| stream-security.process_discovery_containers.containers.stream-security-process-discovery.limits.memory | string | `"2048Mi"` |  |
| stream-security.process_discovery_containers.containers.stream-security-process-discovery.name | string | `"stream-security-process-discovery"` |  |
| stream-security.process_discovery_containers.containers.stream-security-process-discovery.requests.cpu | string | `"800m"` |  |
| stream-security.process_discovery_containers.containers.stream-security-process-discovery.requests.memory | string | `"1024Mi"` |  |
| stream-security.process_discovery_containers.enabled | bool | `false` |  |
| stream-security.process_discovery_image.name | string | `"process-agent"` | Stream Security process discovery agent image name. |
| stream-security.process_discovery_image.pullPolicy | string | `"IfNotPresent"` | Stream Security process discovery agent image pullPolicy |
| stream-security.process_discovery_image.tag | string | `"master.75"` | Stream Security process discovery agent tag to use. |
| stream-security.replicas | int | `1` |  |
| stream-security.serviceAccount.create | bool | `true` |  |
| stream-security.serviceAccount.name | string | `""` | The name of the Service account. If not set and create is true, a name is generated using the fullname template |
| stream-security.stream-security_containers.containers.stream-security-events.command[0] | string | `"/usr/local/bin/python"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.command[1] | string | `"main.py"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.command[2] | string | `"events"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.enabled | bool | `true` |  |
| stream-security.stream-security_containers.containers.stream-security-events.limits.cpu | string | `"2000m"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.limits.memory | string | `"2048Mi"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.name | string | `"stream-security-events"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.requests.cpu | string | `"800m"` |  |
| stream-security.stream-security_containers.containers.stream-security-events.requests.memory | string | `"1024Mi"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.command[0] | string | `"/usr/local/bin/python"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.command[1] | string | `"main.py"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.command[2] | string | `"krs"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.enabled | bool | `true` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.name | string | `"stream-security-krs"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.resources.limits.cpu | string | `"2000m"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.resources.limits.memory | string | `"4096Mi"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.resources.requests.cpu | string | `"1000m"` |  |
| stream-security.stream-security_containers.containers.stream-security-krs.resources.requests.memory | string | `"2048Mi"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.command[1] | string | `"main.py"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.command[2] | string | `"network_policy"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.enabled | bool | `false` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.limits.cpu | string | `"2000m"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.limits.memory | string | `"2048Mi"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.name | string | `"stream-security-network-policy"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.requests.cpu | string | `"800m"` |  |
| stream-security.stream-security_containers.containers.stream-security-network-policy.requests.memory | string | `"1024Mi"` |  |
| stream-security.stream-security_containers.enabled | bool | `true` |  |
| stream-security.tolerations[0].effect | string | `"NoSchedule"` |  |
| stream-security.tolerations[0].key | string | `"re"` |  |
| stream-security.tolerations[0].operator | string | `"Equal"` |  |
| stream-security.tolerations[0].value | string | `"true"` |  |
| stream-security.workflow | string | `"full_scan"` | stream-security workflow type  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
