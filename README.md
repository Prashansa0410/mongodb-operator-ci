# MongoDB Operator CI/CD Demo

This project demonstrates a CI/CD pipeline that deploys a Kubernetes Custom Resource + Operator, simulates pod failures, and validates recovery automatically.

## Structure
- `manifests/`: CRD, Operator, and MongoDBCluster resource
- `tests/`: Shell script to simulate and verify recovery
- `.github/workflows/ci.yml`: GitHub Actions pipeline

## Tech Stack
- Kubernetes (Minikube/kind)
- GitHub Actions
- Kubectl
- Shell scripting
