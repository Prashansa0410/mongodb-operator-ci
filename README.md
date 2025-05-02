## CI/CD MongoDB Operator Validation

This project deploys a mock MongoDB Operator and validates self-healing recovery via GitHub Actions.

### Simulated Flow

1. Deploys CRD + Operator
2. Creates MongoDBCluster resource
3. Deletes a MongoDB pod
4. Validates if Operator auto-recovers
5. Sends result to Slack/Webhook

> Inspired by real-world Operator patterns.

Run manually:
```bash
kubectl apply -f manifests/
bash tests/validate_recovery.sh
