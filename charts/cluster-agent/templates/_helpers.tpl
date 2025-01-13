{{/* vim: set filetype=mustache: */}}

{{/*
define ECR url based on the AWS account
*/}}
{{- define "ecrUrl" -}}
    {{- .Values.stream_securityAwsAccount -}}.dkr.ecr.us-east-1.amazonaws.com
{{- end -}}

{{- define "stream_security.image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream_security.image.name }}:{{ .Values.stream_security.image.tag }}
{{- end -}}

{{- define "stream_security.cost-image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream_security.image.name }}:{{ .Values.stream_security.cost_image.tag }}
{{- end -}}

{{- define "stream_security.process-discovery-image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream_security.process_discovery_image.name }}:{{ .Values.stream_security.process_discovery_image.tag }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "stream_security.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "stream_security.fullname" -}}
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
{{- define "stream_security.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "stream_security.labels" -}}
helm.sh/chart: {{ include "stream_security.chart" . }}
{{ include "stream_security.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "stream_security.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stream_security.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return secret name to be used based on provided values.
*/}}
{{- define "stream_security.apiTokenSecretName" -}}
{{- $fullName := include "stream_security.fullname" . -}}
{{- default $fullName .Values.stream_security.apiTokenExistingSecret | quote -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "stream_security.serviceAccountName" -}}
{{- if .Values.stream_security.serviceAccount.create }}
{{- default (include "stream_security.name" .) .Values.stream_security.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.stream_security.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "stream_security.clusterRoleName" -}}
{{- coalesce (.Values.stream_security.clusterRole.name) (printf "%s-cluster-role" .Release.Name) }}
{{- end }}