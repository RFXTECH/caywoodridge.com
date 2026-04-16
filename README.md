# caywoodridge.com

CaywoodRidge.com static website.

## Container

Build and run locally:

```bash
docker build -t caywoodridge:local .
docker run --rm -p 8080:8080 caywoodridge:local
```

Open http://localhost:8080

## Kubernetes

Apply manifests manually:

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

## GitHub Actions Pipeline

Workflow: `.github/workflows/deploy.yml`

On pushes to `main` (or manual trigger), it:
1. Builds and pushes a container image to GHCR.
2. Applies Kubernetes manifests.
3. Updates the Deployment image to the current commit SHA.
4. Waits for rollout completion.

Required GitHub secret:
- `KUBE_CONFIG`: full kubeconfig content for the target cluster.

Notes:
- The ingress host is set to `caywoodridge.com` in `k8s/ingress.yaml`.
- TLS secret is expected as `caywoodridge-tls`.
- The deployment namespace is `caywoodridge`.
