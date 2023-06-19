{{/* vim: set filetype=mustache: */}}

{{/*
define ECR url based on the AWS account
*/}}
{{- define "ecrUrl" -}}
    {{- .Values.lightlyticsAwsAccount -}}.dkr.ecr.us-east-1.amazonaws.com
{{- end -}}

{{- define "lightlytics.image-path" -}}
  {{ .Values.registry }}/{{ .Values.lightlytics.image.name }}:{{ .Values.lightlytics.image.tag }}
{{- end -}}

{{- define "lightlytics.cost-image-path" -}}
  {{ .Values.registry }}/{{ .Values.lightlytics.image.name }}:{{ .Values.lightlytics.cost_image.tag }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "lightlytics.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lightlytics.fullname" -}}
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
{{- define "lightlytics.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lightlytics.labels" -}}
helm.sh/chart: {{ include "lightlytics.chart" . }}
{{ include "lightlytics.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lightlytics.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lightlytics.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lightlytics.serviceAccountName" -}}
{{- if .Values.lightlytics.serviceAccount.create }}
{{- default (include "lightlytics.name" .) .Values.lightlytics.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.lightlytics.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "lightlytics.clusterRoleName" -}}
{{- if .Values.lightlytics.clusterRole.create }}
{{- default (include "lightlytics.name" .) .Values.lightlytics.clusterRole.name }}
{{- else }}
{{- default "default" .Values.lightlytics.clusterRole.name }}
{{- end }}
{{- end }}