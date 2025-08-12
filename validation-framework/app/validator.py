import yaml

def load_manifests(file_path):
    with open(file_path) as f:
        return list(yaml.safe_load_all(f))

def is_deployment(manifest):
    return manifest.get("kind") == "Deployment"

def validate_container(container, doc_index):
    name = container.get("name", "<unnamed>")
    security_context = container.get("securityContext", {})
    if security_context.get("runAsNonRoot") is True:
        print(f"✅ Container '{name}' in Document {doc_index} has runAsNonRoot enabled.")
    else:
        print(f"❌ Container '{name}' in Document {doc_index} does NOT have runAsNonRoot enabled.")

def validate_manifest(manifest_file):
    manifests = load_manifests(manifest_file)
    for i, manifest in enumerate(manifests, 1):
        if not is_deployment(manifest):
            print(f"❌ Document {i}: Not a Deployment (found: {manifest.get('kind')})")
            continue

        containers = manifest.get("spec", {}).get("template", {}).get("spec", {}).get("containers", [])
        if not containers:
            print(f"⚠️ Document {i}: No containers found in Deployment spec.")
            continue

        for container in containers:
            validate_container(container, i)
