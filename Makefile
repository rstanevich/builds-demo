
install:
	kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.35.1/release.yaml
	kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.26.0/tekton-dashboard-release.yaml
	kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.6/git-clone.yaml
	kubectl apply -f 00-expose.yaml
	kubectl apply -f 00-minio.yaml

config:
	kubectl delete -f 01-config.yaml || true
	kubectl apply -f 01-config.yaml

	kubectl apply -f 01-secret.yaml || true

run:
	kubectl delete -f 02-run.yaml || true
	kubectl apply -f 02-run.yaml

go:
	kubectl apply -f 03-go.yaml
