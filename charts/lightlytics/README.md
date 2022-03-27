# Lightlytics

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![AppVersion: 64](https://img.shields.io/badge/AppVersion-64-informational?style=flat-square)

[Lighlytics](https://www.lightlytics.com) enables your SRE/DevOps team to automatically predict, pre-empt, and prevent failures, downtime, or business disruption caused by infrastructure development or updates by simulating all possible dependencies and impact on operations before deployment.
This chart adds Lightlytics agent to your Kubernetes cluster via deployment.


## How to use Lightlytics Helm repository
You need to add Lightlytics helm repository to your local Helm repositories:

```
helm repo add lightlytics https://lightlytics.github.io/helm-charts
helm repo update
```

## Prerequisites

## Quick start

### Installing the Lightlytics Chart

```bash
helm install lightlytics --set lightlytics.apiToken=<LIGHTLYTICS_API_TOKEN> --set lightlytics.apiUrl=<LIGHTLYTICS_API_URL> -n lightlytics --create-namespace lightlytics/lightlytics
```
