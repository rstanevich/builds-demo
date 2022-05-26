# builds-demo

Steps:

- Add your dockerhub secrets and service account for running jobs in file `deploy/03-secret.yaml`

```
---
apiVersion: v1
kind: Secret
metadata:
  name: basic-user-pass-docker
  annotations:
    tekton.dev/docker-0: https://index.docker.io/v1/
type: kubernetes.io/basic-auth
data:
  password: passwordBase64
  username: usernameBase64

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: build-bot
secrets:
  - name: basic-user-pass-docker
```

- Replace all `russtanevich` in `deploy/04-pipelinerun.yaml` with your docker registry

- Deploy tekton and other helpful components in local Kubernetes in Docker etc - `make install`

- Explore tekton and minio (only for buildkit s3 cache) `make tools`

- Run/update pipeline `make run` (You can rerun via UI)

- Recommendation - Open settings in Tekton dashboard and enable timestamp for logs.
