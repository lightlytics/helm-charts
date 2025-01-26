# streamsec-agent

## How to use Stream Security Agent Helm repository
To begin, add the Stream Security Agent Helm repository to your local Helm repositories:

```
helm repo add streamsec https://lightlytics.github.io/helm-charts
helm repo update
helm install streamsec-agent --set streamsec.apiToken=<API_TOKEN> --set streamsec.apiUrl=<API_URL> -n streamsec-agent --create-namespace streamsec/streamsec-agent`


![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Stream Security Agent Helm Chart

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `nil` |  |
| nameOverride | string | `nil` |  |
| registry | string | `"public.ecr.aws/k6v9y5g3"` |  |
| streamsec.apiToken | string | `nil` | Stream Security API token for your Kubernetes cluster Required: Set your Stream Security API token here ref : |
| streamsec.apiTokenExistingSecret | string | `nil` | Use existing Secret which stores API key instead of creating a new one. The value should be set with the `api-key` key inside the secret. # If set, this parameter takes precedence over "apiToken". |
| streamsec.apiUrl | string | `nil` | Stream Security site url Required: Set your Stream Security API URL here |
| streamsec.clusterRole.create | bool | `true` |  |
| streamsec.clusterRole.name | string | `""` |  |
| streamsec.cluster_agent_containers.containers.events.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.events.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.events.command[2] | string | `"events"` |  |
| streamsec.cluster_agent_containers.containers.events.enabled | bool | `true` |  |
| streamsec.cluster_agent_containers.containers.events.limits.cpu | string | `"2000m"` |  |
| streamsec.cluster_agent_containers.containers.events.limits.memory | string | `"2048Mi"` |  |
| streamsec.cluster_agent_containers.containers.events.name | string | `"streamsec-events"` |  |
| streamsec.cluster_agent_containers.containers.events.requests.cpu | string | `"800m"` |  |
| streamsec.cluster_agent_containers.containers.events.requests.memory | string | `"1024Mi"` |  |
| streamsec.cluster_agent_containers.containers.krs.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.krs.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.krs.command[2] | string | `"krs"` |  |
| streamsec.cluster_agent_containers.containers.krs.enabled | bool | `true` |  |
| streamsec.cluster_agent_containers.containers.krs.name | string | `"streamsec-krs"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.limits.memory | string | `"4096Mi"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.requests.cpu | string | `"1000m"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.requests.memory | string | `"2048Mi"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[2] | string | `"network_policy"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.enabled | bool | `false` |  |
| streamsec.cluster_agent_containers.containers.network-policy.limits.cpu | string | `"2000m"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.limits.memory | string | `"2048Mi"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.name | string | `"network-policy"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.requests.cpu | string | `"800m"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.requests.memory | string | `"1024Mi"` |  |
| streamsec.cluster_agent_containers.enabled | bool | `true` |  |
| streamsec.cost_containers.containers.connector.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cost_containers.containers.connector.command[1] | string | `"connector.py"` |  |
| streamsec.cost_containers.containers.connector.name | string | `"connector"` |  |
| streamsec.cost_containers.containers.connector.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cost_containers.containers.connector.resources.limits.memory | string | `"2048Mi"` |  |
| streamsec.cost_containers.containers.connector.resources.requests.cpu | string | `"800m"` |  |
| streamsec.cost_containers.containers.connector.resources.requests.memory | string | `"1024Mi"` |  |
| streamsec.cost_containers.containers.cost.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cost_containers.containers.cost.command[1] | string | `"cost.py"` |  |
| streamsec.cost_containers.containers.cost.name | string | `"cost"` |  |
| streamsec.cost_containers.containers.cost.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cost_containers.containers.cost.resources.limits.memory | string | `"2048Mi"` |  |
| streamsec.cost_containers.containers.cost.resources.requests.cpu | string | `"800m"` |  |
| streamsec.cost_containers.containers.cost.resources.requests.memory | string | `"1024Mi"` |  |
| streamsec.cost_containers.enabled | bool | `true` |  |
| streamsec.cost_image.name | string | `"cluster-agent"` | Stream Security cost agent image name. |
| streamsec.cost_image.pullPolicy | string | `"IfNotPresent"` | Stream Security cost agent image pullPolicy |
| streamsec.cost_image.tag | string | `"cost_k8s_process.578"` | Stream Security cost agent tag to use. |
| streamsec.dnsConfig | object | `{}` |  |
| streamsec.env.DEBUG | bool | `false` |  |
| streamsec.env.LOGLEVEL | string | `"INFO"` |  |
| streamsec.equalsLabelSelector | string | `nil` |  |
| streamsec.existLabelSelector | string | `nil` |  |
| streamsec.fieldSelectorsNames | string | `nil` |  |
| streamsec.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |
| streamsec.filterRunningPods | bool | `true` | takes only pods which at status running |
| streamsec.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| streamsec.image.name | string | `"cluster-agent"` | Stream Security agent image name. |
| streamsec.image.pullPolicy | string | `"IfNotPresent"` | Stream Security agent image pullPolicy |
| streamsec.image.tag | string | `"master.577"` | Stream Security agent tag to use. |
| streamsec.inLabelSelector | string | `nil` |  |
| streamsec.port | int | `443` | streamsec port |
| streamsec.process_discovery_containers.containers.process-discovery.limits.cpu | string | `"2000m"` |  |
| streamsec.process_discovery_containers.containers.process-discovery.limits.memory | string | `"2048Mi"` |  |
| streamsec.process_discovery_containers.containers.process-discovery.name | string | `"process-discovery"` |  |
| streamsec.process_discovery_containers.containers.process-discovery.requests.cpu | string | `"800m"` |  |
| streamsec.process_discovery_containers.containers.process-discovery.requests.memory | string | `"1024Mi"` |  |
| streamsec.process_discovery_containers.enabled | bool | `false` |  |
| streamsec.process_discovery_image.name | string | `"process-agent"` | Stream Security process discovery agent image name. |
| streamsec.process_discovery_image.pullPolicy | string | `"IfNotPresent"` | Stream Security process discovery agent image pullPolicy |
| streamsec.process_discovery_image.tag | string | `"master.75"` | Stream Security process discovery agent tag to use. |
| streamsec.replicas | int | `1` |  |
| streamsec.serviceAccount.create | bool | `true` |  |
| streamsec.serviceAccount.name | string | `""` | The name of the Service account. If not set and create is true, a name is generated using the fullname template |
| streamsec.tolerations[0].effect | string | `"NoSchedule"` |  |
| streamsec.tolerations[0].key | string | `"re"` |  |
| streamsec.tolerations[0].operator | string | `"Equal"` |  |
| streamsec.tolerations[0].value | string | `"true"` |  |
| streamsec.workflow | string | `"full_scan"` | streamsec workflow type  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
