#!/bin/bash
set -e  # Exit on any error

# Run the Kubernetes manifest validator
echo "🔍 Validating Kubernetes manifests..."
python3 validation-framework/app/main.py --manifest k8s/deployment.yaml

echo "✅ Validation completed."
