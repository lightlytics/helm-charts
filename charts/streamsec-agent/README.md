# streamsec-agent

![Version: 1.1.36](https://img.shields.io/badge/Version-1.1.36-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.4](https://img.shields.io/badge/AppVersion-1.1.4-informational?style=flat-square)

Stream Security Agent Helm Chart

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://helm.cilium.io | tetragon | 1.4.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dnsPolicy | string | `"Default"` |  |
| fullnameOverride | string | `nil` |  |
| nameOverride | string | `nil` |  |
| registry | string | `"public.ecr.aws/stream-security"` |  |
| streamsec.apiToken | string | `nil` | Stream Security API token for your Kubernetes cluster Required: Set your Stream Security API token here ref : |
| streamsec.apiTokenExistingSecret | string | `nil` | Use existing Secret which stores API key instead of creating a new one. The value should be set with the `api-key` key inside the secret. # If set, this parameter takes precedence over "apiToken". |
| streamsec.apiUrl | string | `nil` | Stream Security site url Required: Set your Stream Security API URL here |
| streamsec.clusterRole.create | bool | `true` |  |
| streamsec.clusterRole.name | string | `""` |  |
| streamsec.cluster_agent_containers.containers.events.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.events.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.events.command[2] | string | `"events"` |  |
| streamsec.cluster_agent_containers.containers.events.enabled | bool | `true` |  |
| streamsec.cluster_agent_containers.containers.events.name | string | `"events"` |  |
| streamsec.cluster_agent_containers.containers.events.resources | object | `{}` |  |
| streamsec.cluster_agent_containers.containers.krs.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.krs.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.krs.command[2] | string | `"krs"` |  |
| streamsec.cluster_agent_containers.containers.krs.enabled | bool | `true` |  |
| streamsec.cluster_agent_containers.containers.krs.name | string | `"krs"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.limits.memory | string | `"4096Mi"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.requests.cpu | string | `"1000m"` |  |
| streamsec.cluster_agent_containers.containers.krs.resources.requests.memory | string | `"2048Mi"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.command[2] | string | `"network_policy"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.enabled | bool | `false` |  |
| streamsec.cluster_agent_containers.containers.network-policy.name | string | `"network-policy"` |  |
| streamsec.cluster_agent_containers.containers.network-policy.resources | object | `{}` |  |
| streamsec.cluster_agent_containers.containers.tracing-policy.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cluster_agent_containers.containers.tracing-policy.command[1] | string | `"main.py"` |  |
| streamsec.cluster_agent_containers.containers.tracing-policy.command[2] | string | `"tracing_policy"` |  |
| streamsec.cluster_agent_containers.containers.tracing-policy.name | string | `"tracing-policy"` |  |
| streamsec.cluster_agent_containers.containers.tracing-policy.resources | object | `{}` |  |
| streamsec.cluster_agent_containers.enabled | bool | `true` |  |
| streamsec.cost_containers.containers.connector.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cost_containers.containers.connector.command[1] | string | `"main.py"` |  |
| streamsec.cost_containers.containers.connector.command[2] | string | `"connector"` |  |
| streamsec.cost_containers.containers.connector.name | string | `"connector"` |  |
| streamsec.cost_containers.containers.connector.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cost_containers.containers.connector.resources.limits.memory | string | `"2048Mi"` |  |
| streamsec.cost_containers.containers.connector.resources.requests.cpu | string | `"800m"` |  |
| streamsec.cost_containers.containers.connector.resources.requests.memory | string | `"1024Mi"` |  |
| streamsec.cost_containers.containers.cost.command[0] | string | `"/usr/local/bin/python"` |  |
| streamsec.cost_containers.containers.cost.command[1] | string | `"main.py"` |  |
| streamsec.cost_containers.containers.cost.command[2] | string | `"cost"` |  |
| streamsec.cost_containers.containers.cost.name | string | `"cost"` |  |
| streamsec.cost_containers.containers.cost.resources.limits.cpu | string | `"2000m"` |  |
| streamsec.cost_containers.containers.cost.resources.limits.memory | string | `"2048Mi"` |  |
| streamsec.cost_containers.containers.cost.resources.requests.cpu | string | `"800m"` |  |
| streamsec.cost_containers.containers.cost.resources.requests.memory | string | `"1024Mi"` |  |
| streamsec.cost_containers.enabled | bool | `false` |  |
| streamsec.cost_image.digest | string | `"sha256:347d1664be10ee06e2a4e336cf8c783ba1ce816cba6c8609116b7c5decd31aea"` | Stream Security cost agent image digest to use. |
| streamsec.cost_image.name | string | `"cluster-agent"` | Stream Security cost agent image name. |
| streamsec.cost_image.pullPolicy | string | `"IfNotPresent"` | Stream Security cost agent image pullPolicy |
| streamsec.cost_image.tag | string | `"1.1.2"` | Stream Security cost agent tag to use. |
| streamsec.dnsConfig | object | `{}` |  |
| streamsec.env.DEBUG | bool | `false` |  |
| streamsec.env.LOGLEVEL | string | `"INFO"` |  |
| streamsec.equalsLabelSelector | string | `nil` |  |
| streamsec.existLabelSelector | string | `nil` |  |
| streamsec.fieldSelectorsNames | string | `nil` |  |
| streamsec.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |
| streamsec.filterRunningPods | bool | `true` | takes only pods which at status running |
| streamsec.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| streamsec.image.digest | string | `"sha256:347d1664be10ee06e2a4e336cf8c783ba1ce816cba6c8609116b7c5decd31aea"` | Stream Security agent image digest to use. |
| streamsec.image.name | string | `"cluster-agent"` | Stream Security agent image name. |
| streamsec.image.pullPolicy | string | `"IfNotPresent"` | Stream Security agent image pullPolicy |
| streamsec.image.tag | string | `"1.1.2"` | Stream Security agent tag to use. |
| streamsec.inLabelSelector | string | `nil` |  |
| streamsec.port | int | `443` | streamsec port |
| streamsec.process_discovery_containers.containers.process-discovery.name | string | `"process-discovery"` |  |
| streamsec.process_discovery_containers.containers.process-discovery.resources | object | `{}` |  |
| streamsec.process_discovery_containers.enabled | bool | `false` |  |
| streamsec.process_discovery_image.name | string | `"process-agent"` | Stream Security process discovery agent image name. |
| streamsec.process_discovery_image.pullPolicy | string | `"IfNotPresent"` | Stream Security process discovery agent image pullPolicy |
| streamsec.process_discovery_image.tag | string | `"master.75"` | Stream Security process discovery agent tag to use. |
| streamsec.replicas | int | `1` |  |
| streamsec.runtime_agent.affinity | object | `{}` |  |
| streamsec.runtime_agent.enabled | bool | `false` |  |
| streamsec.runtime_agent.image.digest | string | `"sha256:4b8c4c44158640a14d951cd3d250a8ceb39f21656659d351bb32d8b5cee93539"` |  |
| streamsec.runtime_agent.image.name | string | `"runtime-agent"` |  |
| streamsec.runtime_agent.image.pullPolicy | string | `"IfNotPresent"` |  |
| streamsec.runtime_agent.image.tag | string | `"1.1.3"` |  |
| streamsec.runtime_agent.nodeSelector | object | `{}` |  |
| streamsec.runtime_agent.resources | object | `{}` |  |
| streamsec.runtime_agent.tetragonFileName | string | `"tetragon.log"` |  |
| streamsec.runtime_agent.tetragonFilePath | string | `"/var/run/cilium/tetragon/"` |  |
| streamsec.runtime_agent.tolerations[0].operator | string | `"Exists"` |  |
| streamsec.runtime_agent.updateStrategy | object | `{}` |  |
| streamsec.serviceAccount.create | bool | `true` |  |
| streamsec.serviceAccount.name | string | `""` | The name of the Service account. If not set and create is true, a name is generated using the fullname template |
| streamsec.tolerations[0].effect | string | `"NoSchedule"` |  |
| streamsec.tolerations[0].key | string | `"re"` |  |
| streamsec.tolerations[0].operator | string | `"Equal"` |  |
| streamsec.tolerations[0].value | string | `"true"` |  |
| streamsec.workflow | string | `"full_scan"` | streamsec workflow type  |
| tetragon.export.mode | string | `""` |  |
| tetragon.serviceAccount.name | string | `"tetragon"` |  |
| tetragon.tetragon.exportFileMaxSizeMB | int | `50` |  |
| tetragon.tetragon.extraArgs.enable-process-ancestors | bool | `true` |  |
| tetragon.tetragon.extraArgs.enable-process-cred | bool | `true` |  |
| tetragon.tetragon.fieldFilters | string | `"{\"event_set\":[\"PROCESS_KPROBE\",\"PROCESS_EXIT\"], \"fields\":\"parent\", \"action\":\"EXCLUDE\"}\n{\"event_set\":[\"PROCESS_KPROBE\",\"PROCESS_EXIT\",\"PROCESS_EXEC\"],\"fields\":\"process.parent_exec_id,parent.parent_exec_id,ancestors.parent_exec_id,parent.cwd,ancestors.exec_id\", \"action\":\"EXCLUDE\"}\"\n{\"event_set\":[\"PROCESS_EXEC\"],\"fields\":\"process.cap,parent.cap,parent.process_credentials,ancestors.cap,ancestors.process_credentials\", \"action\":\"EXCLUDE\"}\"\n"` |  |
| tetragon.tetragon.grpc.address | string | `"localhost:59751"` |  |
| tetragon.tetragon.healthGrpc.port | int | `9763` |  |
| tetragon.tetragonOperator.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
