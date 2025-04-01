# lightlytics

![Version: 0.1.23](https://img.shields.io/badge/Version-0.1.23-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.23.0](https://img.shields.io/badge/AppVersion-1.23.0-informational?style=flat-square)

A Helm chart for StreamSec Kubernetes agent

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `nil` |  |
| lightlytics.apiToken | string | `nil` | Lightlytics API token for your Kubernetes cluster Required: Set your Lightlytics API token here ref : |
| lightlytics.apiTokenExistingSecret | string | `nil` | Use existing Secret which stores API key instead of creating a new one. The value should be set with the `api-key` key inside the secret. # If set, this parameter takes precedence over "apiToken". |
| lightlytics.apiUrl | string | `nil` | Lightlytics site url Required: Set your Lightlytics API URL here |
| lightlytics.clusterRole.create | bool | `true` |  |
| lightlytics.clusterRole.name | string | `"lightltyicscr"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.command[0] | string | `"/usr/local/bin/python"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.command[1] | string | `"main.py"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.command[2] | string | `"connector"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.name | string | `"lightlytics-connector"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.resources.limits.cpu | string | `"2000m"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.resources.limits.memory | string | `"2048Mi"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.resources.requests.cpu | string | `"800m"` |  |
| lightlytics.cost_containers.containers.lightlytics-connector.resources.requests.memory | string | `"1024Mi"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.command[0] | string | `"/usr/local/bin/python"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.command[1] | string | `"main.py"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.command[2] | string | `"cost"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.name | string | `"lightlytics-cost"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.resources.limits.cpu | string | `"2000m"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.resources.limits.memory | string | `"2048Mi"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.resources.requests.cpu | string | `"800m"` |  |
| lightlytics.cost_containers.containers.lightlytics-cost.resources.requests.memory | string | `"1024Mi"` |  |
| lightlytics.cost_containers.enabled | bool | `true` |  |
| lightlytics.cost_image.name | string | `"cluster-agent"` | Lightlytics cost agent image name. |
| lightlytics.cost_image.pullPolicy | string | `"IfNotPresent"` | Lightlytics cost agent image pullPolicy |
| lightlytics.cost_image.tag | string | `"master.584"` | Lightlytics cost agent tag to use. |
| lightlytics.dnsConfig | object | `{}` |  |
| lightlytics.env.DEBUG | bool | `false` |  |
| lightlytics.env.LOGLEVEL | string | `"INFO"` |  |
| lightlytics.equalsLabelSelector | string | `nil` |  |
| lightlytics.existLabelSelector | string | `nil` |  |
| lightlytics.fieldSelectorsNames | string | `nil` |  |
| lightlytics.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |
| lightlytics.filterRunningPods | bool | `true` | takes only pods which at status running |
| lightlytics.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| lightlytics.image.name | string | `"cluster-agent"` | Lightlytics agent image name. |
| lightlytics.image.pullPolicy | string | `"IfNotPresent"` | Lightlytics agent image pullPolicy |
| lightlytics.image.tag | string | `"master.584"` | Lightlytics agent tag to use. |
| lightlytics.inLabelSelector | string | `nil` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.command[0] | string | `"/usr/local/bin/python"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.command[1] | string | `"main.py"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.command[2] | string | `"events"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.enabled | bool | `true` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.limits.cpu | string | `"2000m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.limits.memory | string | `"2048Mi"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.name | string | `"lightlytics-events"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.requests.cpu | string | `"800m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-events.requests.memory | string | `"1024Mi"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.command[0] | string | `"/usr/local/bin/python"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.command[1] | string | `"main.py"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.command[2] | string | `"krs"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.enabled | bool | `true` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.name | string | `"lightlytics-krs"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.resources.limits.cpu | string | `"2000m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.resources.limits.memory | string | `"4096Mi"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.resources.requests.cpu | string | `"1000m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-krs.resources.requests.memory | string | `"2048Mi"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.command[1] | string | `"main.py"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.command[2] | string | `"network_policy"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.enabled | bool | `false` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.limits.cpu | string | `"2000m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.limits.memory | string | `"2048Mi"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.name | string | `"lightlytics-network-policy"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.requests.cpu | string | `"800m"` |  |
| lightlytics.lightlytics_containers.containers.lightlytics-network-policy.requests.memory | string | `"1024Mi"` |  |
| lightlytics.lightlytics_containers.enabled | bool | `true` |  |
| lightlytics.port | int | `443` | lightlytics port |
| lightlytics.process_discovery_containers.containers.lightlytics-process-discovery.limits.cpu | string | `"2000m"` |  |
| lightlytics.process_discovery_containers.containers.lightlytics-process-discovery.limits.memory | string | `"2048Mi"` |  |
| lightlytics.process_discovery_containers.containers.lightlytics-process-discovery.name | string | `"lightlytics-process-discovery"` |  |
| lightlytics.process_discovery_containers.containers.lightlytics-process-discovery.requests.cpu | string | `"800m"` |  |
| lightlytics.process_discovery_containers.containers.lightlytics-process-discovery.requests.memory | string | `"1024Mi"` |  |
| lightlytics.process_discovery_containers.enabled | bool | `false` |  |
| lightlytics.process_discovery_image.name | string | `"process-agent"` | Lightlytics process discovery agent image name. |
| lightlytics.process_discovery_image.pullPolicy | string | `"IfNotPresent"` | Lightlytics process discovery agent image pullPolicy |
| lightlytics.process_discovery_image.tag | string | `"master.75"` | Lightlytics process discovery agent tag to use. |
| lightlytics.replicas | int | `1` |  |
| lightlytics.serviceAccount.create | bool | `true` |  |
| lightlytics.serviceAccount.name | string | `"lightlyticssa"` | The name of the Service account. If not set and create is true, a name is generated using the fullname template |
| lightlytics.tolerations[0].effect | string | `"NoSchedule"` |  |
| lightlytics.tolerations[0].key | string | `"re"` |  |
| lightlytics.tolerations[0].operator | string | `"Equal"` |  |
| lightlytics.tolerations[0].value | string | `"true"` |  |
| lightlytics.workflow | string | `"full_scan"` | lightlytics workflow type  |
| nameOverride | string | `nil` |  |
| registry | string | `"public.ecr.aws/k6v9y5g3"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
