import argparse
import sys
from validator import validate_manifest
 
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Kubernetes Manifest Validator")
    parser.add_argument("--manifest", required=True, help="Path to Kubernetes manifest file")
    args = parser.parse_args()
 
    results = validate_manifest(args.manifest)
 
    # Fail if any validation fails
    failed = [r for r in results if r["status"] == "fail"]
    if failed:
        print("\n❌ Validation failed")
        sys.exit(1)
    else:
        print("\n✅ All validations passed")
        sys.exit(0)