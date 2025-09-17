import yaml
import json
 
def validate_manifest(manifest_file):
    results = []
    with open(manifest_file) as f:
        docs = yaml.safe_load_all(f)
        for i, manifest in enumerate(docs):
            kind = manifest.get("kind")
            if kind != "Deployment":
                results.append({
                    "doc": i+1,
                    "status": "fail",
                    "reason": f"Not a Deployment (found: {kind})"
                })
                continue
 
            containers = manifest.get("spec", {}) \
                                 .get("template", {}) \
                                 .get("spec", {}) \
                                 .get("containers", [])
 
            if not containers:
                results.append({
                    "doc": i+1,
                    "status": "fail",
                    "reason": "No containers in Deployment"
                })
                continue
 
            for container in containers:
                name = container.get("name", "<unnamed>")
                security_context = container.get("securityContext", {})
                resources = container.get("resources", {})
                probes = {
                    "livenessProbe": container.get("livenessProbe"),
                    "readinessProbe": container.get("readinessProbe")
                }
 
                # Checks
                if not security_context.get("runAsNonRoot"):
                    results.append({
                        "doc": i+1, "container": name,
                        "status": "fail",
                        "reason": "runAsNonRoot missing"
                    })
                if "limits" not in resources:
                    results.append({
                        "doc": i+1, "container": name,
                        "status": "fail",
                        "reason": "Resource limits not set"
                    })
                if not all(probes.values()):
                    results.append({
                        "doc": i+1, "container": name,
                        "status": "fail",
                        "reason": "Liveness/Readiness probe missing"
                    })
 
                if all(r["status"] == "pass" for r in results):
                    results.append({
                        "doc": i+1, "container": name,
                        "status": "pass"
                    })
 
    print(json.dumps(results, indent=2))
    return results
 