import yaml
 
def validate_manifest(manifest_file):
    with open(manifest_file) as f:
        docs = yaml.safe_load_all(f)
        for i, manifest in enumerate(docs):
            kind = manifest.get("kind")
            if kind != "Deployment":
                print(f"❌ Document {i+1}: Not a Deployment (found: {kind})")
                continue
 
            spec = manifest.get("spec", {})
            template = spec.get("template", {})
            pod_spec = template.get("spec", {})
            containers = pod_spec.get("containers", [])
 
            if not containers:
                print(f"⚠️ Document {i+1}: No containers found in Deployment spec.")
                continue
 
            for container in containers:
                name = container.get("name", "<unnamed>")
                security_context = container.get("securityContext", {})
                if security_context.get("runAsNonRoot") is True:
                    print(f"✅ Container '{name}' in Document {i+1} has runAsNonRoot enabled.")
                else:
                    print(f"❌ Container '{name}'in Document {i+1} does NOT have runAsNonRoot enabled.")
 