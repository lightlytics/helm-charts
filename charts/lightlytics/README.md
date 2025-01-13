# StreamSec Agent Advanced Documentation
[StreamSecurity](https://www.stream.security) - The Only Cloud Detection & Response Solution SecOps Teams Can Trust.
Real-Time Cloud Threat and Exposure Modeling Accelerates Response.

## How to use Lightlytics Helm repository
To begin, add the Lightlytics Helm repository to your local Helm repositories:

```
helm repo add lightlytics https://lightlytics.github.io/helm-charts
helm repo update
helm install lightlytics --version <latest version> --set lightlytics.apiToken=<YOUR_API_TOKEN> --set lightlytics.apiUrl=<YOUR_ENV_URL> -n StreamSec-Agent --create-namespace lightlytics/lightlytics
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| lightlytics.apiToken | string |  | Lightlytics API token for your Kubernetes cluster |
| lightlytics.apiUrl | string |  | Lightlytics site url |
| lightlytics.fullScanScheduleSeconds | int | `1800` | periodic Kubernetes resources scan at seconds |
| lightlytics.filterRunningPods | bool | `true` | takes only pods which at status running |
| lightlytics.fieldSelectorsNamespaces | string | `nil` | filter/unfilter resources from specific namespace |

## custom Values
### dnsConfig
The Helm chart supports adding a custom dnsConfig. You can pass these values using one of two methods.
1. Pass custom values as part of the helm install command as a set command, example below:
   (In case an error presented after command executed please use the second option)
```
  --set 'lightlytics.dnsConfig.options[0].name=ndots' \
  --set 'lightlytics.dnsConfig.options[0].value=2'
```
2. Creating a custom-values.yaml file, example below:
```
lightlytics:
  apiToken: <The API token>
  apiUrl: <The Site URL>
  dnsConfig:
    options:
    - name: ndots
      value: "<ndots value>"
```
reference the file in the helm install command using the -f <file name> parameter, example:

'helm upgrade --install lightlytics --version 0.1.16 -n streamsec-agent --create-namespace lightlytics/lightlytics -f custom-values.yaml'
