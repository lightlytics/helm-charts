{{/* vim: set filetype=mustache: */}}

{{/*
define ECR url based on the AWS account
*/}}
{{- define "ecrUrl" -}}
    {{- .Values.streamsecAwsAccount -}}.dkr.ecr.us-east-1.amazonaws.com
{{- end -}}

{{- define "streamsec.image-path" -}}
  {{ .Values.registry }}/{{ .Values.streamsec.image.name }}:{{ .Values.streamsec.image.tag }}
{{- end -}}

{{- define "streamsec.cost-image-path" -}}
  {{ .Values.registry }}/{{ .Values.streamsec.image.name }}:{{ .Values.streamsec.cost_image.tag }}
{{- end -}}

{{- define "streamsec.process-discovery-image-path" -}}
  {{ .Values.registry }}/{{ .Values.streamsec.process_discovery_image.name }}:{{ .Values.streamsec.process_discovery_image.tag }}
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