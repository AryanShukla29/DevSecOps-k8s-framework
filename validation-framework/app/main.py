import argparse
from validator import   validate_manifest

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--manifest',required=True)
    args = parser.parse_args()
    validate_manifest(args.manifest)