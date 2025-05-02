#!/bin/bash

set -e

echo "Simulating pod failure..."
POD=$(kubectl get pods -l app=mongodb -o name | head -n 1)
kubectl delete "$POD"

echo "Waiting for recovery..."
sleep 20

READY=$(kubectl get pods -l app=mongodb --no-headers | grep -c "Running")

if [ "$READY" -ge 3 ]; then
  echo "✅ Recovery successful"
  curl -X POST -H 'Content-type: application/json' --data '{"text":"Recovery successful!"}' $WEBHOOK_URL
  exit 0
else
  echo "❌ Recovery failed"
  curl -X POST -H 'Content-type: application/json' --data '{"text":"Recovery failed!"}' $WEBHOOK_URL
  exit 1
fi
