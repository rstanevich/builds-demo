
install:
# Install tekton 
	kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.35.1/release.yaml
	kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.26.0/tekton-dashboard-release.yaml
	kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.6/git-clone.yaml
# Expose to localhost
	kubectl apply -f deploy/01-expose.yaml
# Cache for buildkit (s3 compatible)
# kubectl apply -f deploy/02-minio.yaml
	kubectl apply -f deploy/03-secret.yaml || true

run:
	kubectl apply -f deploy/04-pipelinerun.yaml

tools:
# Tekton dashboard
	open http://localhost:32080
# Minio to expore cache: Creds "minio" - "minio123"
	open http://localhost:32090
