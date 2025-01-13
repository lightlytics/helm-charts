{{/* vim: set filetype=mustache: */}}

{{/*
define ECR url based on the AWS account
*/}}
{{- define "ecrUrl" -}}
    {{- .Values.stream-securityAwsAccount -}}.dkr.ecr.us-east-1.amazonaws.com
{{- end -}}

{{- define "stream-security.image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream-security.image.name }}:{{ .Values.stream-security.image.tag }}
{{- end -}}

{{- define "stream-security.cost-image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream-security.image.name }}:{{ .Values.stream-security.cost_image.tag }}
{{- end -}}

{{- define "stream-security.process-discovery-image-path" -}}
  {{ .Values.registry }}/{{ .Values.stream-security.process_discovery_image.name }}:{{ .Values.stream-security.process_discovery_image.tag }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "stream-security.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "stream-security.fullname" -}}
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
{{- define "stream-security.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "stream-security.labels" -}}
helm.sh/chart: {{ include "stream-security.chart" . }}
{{ include "stream-security.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "stream-security.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stream-security.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return secret name to be used based on provided values.
*/}}
{{- define "stream-security.apiTokenSecretName" -}}
{{- $fullName := include "stream-security.fullname" . -}}
{{- default $fullName .Values.stream-security.apiTokenExistingSecret | quote -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "stream-security.serviceAccountName" -}}
{{- if .Values.stream-security.serviceAccount.create }}
{{- default (include "stream-security.name" .) .Values.stream-security.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.stream-security.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "stream-security.clusterRoleName" -}}
{{- coalesce (.Values.stream-security.clusterRole.name) (printf "%s-cluster-role" .Release.Name) }}
{{- end }}