{{/* vim: set filetype=mustache: */}}

{{/*
define ECR url based on the AWS account
*/}}
{{- define "ecrUrl" -}}
    {{- .Values.streamsecAwsAccount -}}.dkr.ecr.us-east-1.amazonaws.com
{{- end -}}

{{- define "streamsec.image-path" -}}
  {{- if .Values.streamsec.image.digest }}
  {{- printf "%s/%s:%s@%s" .Values.registry .Values.streamsec.image.name .Values.streamsec.image.tag .Values.streamsec.image.digest }}
  {{- else }}
  {{- printf "%s/%s:%s" .Values.registry .Values.streamsec.image.name .Values.streamsec.image.tag }}
  {{- end }}
{{- end -}}
{{- define "streamsec.cost-image-path" -}}
  {{- if .Values.streamsec.cost_image.digest }}
  {{- printf "%s/%s:%s@%s" .Values.registry .Values.streamsec.cost_image.name .Values.streamsec.cost_image.tag .Values.streamsec.cost_image.digest }}
  {{- else }}
  {{- printf "%s/%s:%s" .Values.registry .Values.streamsec.cost_image.name .Values.streamsec.cost_image.tag }}
  {{- end }}
{{- end -}}

{{- define "streamsec.process-discovery-image-path" -}}
  {{ .Values.registry }}/{{ .Values.streamsec.process_discovery_image.name }}:{{ .Values.streamsec.process_discovery_image.tag }}
{{- end -}}

{{- define "streamsec.runtime-agent-image-path" -}}
  {{- if .Values.streamsec.runtime_agent.image.digest }}
  {{- printf "%s/%s:%s@%s" .Values.registry .Values.streamsec.runtime_agent.image.name .Values.streamsec.runtime_agent.image.tag .Values.streamsec.runtime_agent.image.digest }}
  {{- else }}
  {{- printf "%s/%s:%s" .Values.registry .Values.streamsec.runtime_agent.image.name .Values.streamsec.runtime_agent.image.tag }}
  {{- end }}
{{- end -}}

{{/*
Windows HostProcess runtime-agent image. Registry falls back to the global one, name to
runtime_agent.image.name; an empty tag follows the Linux tag with a "-windows" suffix (one
version to bump). The digest never falls back: the Windows image has its own manifest.
*/}}
{{- define "streamsec.runtime-agent-windows-image-path" -}}
  {{- $img := .Values.streamsec.runtime_agent_windows.image | default dict }}
  {{- $lin := .Values.streamsec.runtime_agent.image }}
  {{- $registry := default .Values.registry $img.registry }}
  {{- $name := default $lin.name $img.name }}
  {{- $tag := default (printf "%s-windows" $lin.tag) $img.tag }}
  {{- if $img.digest }}
  {{- printf "%s/%s:%s@%s" $registry $name $tag $img.digest }}
  {{- else }}
  {{- printf "%s/%s:%s" $registry $name $tag }}
  {{- end }}
{{- end -}}

{{/*
Effective Windows DaemonSet settings (YAML; read back with fromYaml): each key unset or null
in runtime_agent_windows falls back to runtime_agent. nodeSelector always gets
kubernetes.io/os=windows (an explicit runtime_agent_windows one may override it); resources
are deep-merged over runtime_agent.resources.
*/}}
{{- define "streamsec.runtimeAgentWindowsSettings" -}}
{{- $lin := .Values.streamsec.runtime_agent -}}
{{- $win := .Values.streamsec.runtime_agent_windows -}}
{{- $out := dict -}}
{{- range $k := list "affinity" "tolerations" "updateStrategy" "priorityClassName" -}}
{{- if and (hasKey $win $k) (not (kindIs "invalid" (index $win $k))) -}}
{{- $_ := set $out $k (index $win $k) -}}
{{- else -}}
{{- $_ := set $out $k (index $lin $k) -}}
{{- end -}}
{{- end -}}
{{- $_ := set $out "updateStrategy" (default $.Values.updateStrategy $out.updateStrategy) -}}
{{- if and (hasKey $win "nodeSelector") (not (kindIs "invalid" $win.nodeSelector)) -}}
{{- $_ := set $out "nodeSelector" (mergeOverwrite (dict "kubernetes.io/os" "windows") (deepCopy $win.nodeSelector)) -}}
{{- else -}}
{{- $_ := set $out "nodeSelector" (mergeOverwrite (omit ($lin.nodeSelector | default dict) "kubernetes.io/os") (dict "kubernetes.io/os" "windows")) -}}
{{- end -}}
{{- $_ := set $out "resources" (mergeOverwrite (deepCopy ($lin.resources | default dict)) (deepCopy ($win.resources | default dict))) -}}
{{- $_ := set $out "pullPolicy" (default $lin.image.pullPolicy ($win.image | default dict).pullPolicy) -}}
{{- toYaml $out -}}
{{- end -}}

{{/*
Shared env of the runtime-agent DaemonSets (Linux and Windows): streamsec.env + extraEnv.
Call with (dict "root" $ "responseActions" <bool>).
*/}}
{{- define "streamsec.runtimeAgentEnv" -}}
{{- $v := .root.Values.streamsec -}}
- name: POD_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
{{- if .responseActions }}
- name: POD_NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
{{- end }}
- name: NODE_NAME
  valueFrom:
    fieldRef:
      fieldPath: spec.nodeName
- name: API_URL
  value: {{ $v.apiUrl | quote }}
- name: API_TOKEN
  valueFrom:
    secretKeyRef:
      name: {{ template "streamsec.apiTokenSecretName" .root }}
      key: api-key
{{- range $k := list "CLUSTER_ID" "CLUSTER_NAME" "ACCOUNT_ID" "REGION" "RESOURCE_GROUP" }}
{{- if index $v.env $k }}
- name: {{ $k }}
  value: {{ index $v.env $k | quote }}
{{- end }}
{{- end }}
{{- if .responseActions }}
- name: RESPONSE_ACTIONS_ENABLED
  value: "true"
{{- end }}
{{- range $k := list "AI_BODY_ENABLED" "EXTERNAL_INBOUND_BODY_ENABLED" }}
{{- if index $v.env $k }}
- name: {{ $k }}
  value: {{ index $v.env $k | quote }}
{{- end }}
{{- end }}
{{- with $v.extraEnv }}
{{ toYaml . }}
{{- end }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "streamsec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "streamsec.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "streamsec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "streamsec.labels" -}}
helm.sh/chart: {{ include "streamsec.chart" . }}
{{ include "streamsec.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "streamsec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "streamsec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return secret name to be used based on provided values.
*/}}
{{- define "streamsec.apiTokenSecretName" -}}
{{- $fullName := include "streamsec.fullname" . -}}
{{- default $fullName .Values.streamsec.apiTokenExistingSecret | quote -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "streamsec.serviceAccountName" -}}
{{- if .Values.streamsec.serviceAccount.create }}
{{- default (include "streamsec.name" .) .Values.streamsec.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.streamsec.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "streamsec.clusterRoleName" -}}
{{- coalesce (.Values.streamsec.clusterRole.name) (printf "%s-cluster-role" .Release.Name) }}
{{- end }}

{{/*
Effective PriorityClass name for the node-agent DaemonSets.
Returns the configured name only when priorityClass.enabled is true, otherwise empty
(so callers can `if`/`default` on it and omit priorityClassName entirely when disabled).
*/}}
{{- define "streamsec.priorityClassName" -}}
{{- if .Values.streamsec.priorityClass.enabled -}}
{{- .Values.streamsec.priorityClass.name -}}
{{- end -}}
{{- end -}}