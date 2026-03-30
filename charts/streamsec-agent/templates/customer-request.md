We're running OPA Gatekeeper policies on our EKS clusters and the streamsec-agent chart (v1.1.69) generates 12 policy violations per namespace. The chart already has good security defaults (non-root user, readOnlyRootFilesystem, capabilities drop ALL), but a few fields are missing. Here's what we need:

  1. Missing seccompProfile (pod or container level)

  Current: Not set
  Required:
  seccompProfile:
    type: RuntimeDefault

Should be added to the pod-level securityContext (or per-container). This is a Kubernetes best practice and required by the Seccomp PSP/PSS policy.

  2. Missing runAsNonRoot: true (pod level)

  Current: runAsUser: 1000 is set, but runAsNonRoot is not explicitly set to true
  Required:
  securityContext:
    runAsNonRoot: true
    runAsUser: 1000
    runAsGroup: 3000
    fsGroup: 2000
  Gatekeeper checks for the explicit runAsNonRoot: true field - having runAsUser: 1000 alone is not sufficient.

  3. Missing supplementalGroups (pod level)

  Current: Not set
  Required:
  securityContext:
    supplementalGroups: [1000]  # or any value in range 100-65535
  Our K8sPSPAllowedUsers policy requires supplementalGroups to be explicitly defined.

  4. Missing app.kubernetes.io/name label on pods

Current: Pods don't have the app.kubernetes.io/name label
Required: Add app.kubernetes.io/name to pod template labels (standard Kubernetes recommended label per https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/).

  5. automountServiceAccountToken should ideally be false

We understand the agent needs Kubernetes API access for monitoring, so this may not be applicable. However, if possible, consider using a projected service account token volume with audience/expiration restrictions instead of the default automount, which is the more secure pattern.

  6. (Minor) NET_BIND_SERVICE capability may be unnecessary

All containers run Python (/usr/local/bin/python main.py) and don't appear to bind to privileged ports (<1024). If NET_BIND_SERVICE is not actually required, removing it from capabilities.add would tighten the security posture further.

Ideal solution

Expose these as configurable Helm values (e.g., podSecurityContext, containerSecurityContext, podLabels) so we can set them in our values overrides without needing chart changes for every adjustment.
If you have opinion that some of this changes could not or should not be implemented, let us know - we will just whitelist them