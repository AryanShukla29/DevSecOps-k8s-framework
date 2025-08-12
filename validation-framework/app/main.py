import argparse
from validator import validate_manifest

def main():
    parser = argparse.ArgumentParser(
        description="Kubernetes Deployment Manifest Validator"
    )
    parser.add_argument(
        '--manifest',
        required=True,
        help='Path to the Kubernetes manifest YAML file'
    )
    args = parser.parse_args()

    # Run validation
    validate_manifest(args.manifest)

if __name__ == "__main__":
    main()
