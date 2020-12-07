# gitops-demo
```
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install argo-cd argo/argo-cd -f argo-cd/values.yaml --namespace  argo-cd --create-namespace
```