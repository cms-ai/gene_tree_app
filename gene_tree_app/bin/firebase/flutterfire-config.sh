#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=gene-tree-dev-2e250 \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.aigenetreemobile.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.aigenetreemobile.prod \
      --android-out=android/app/src/dev/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=gene-tree-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.aigenetreemobile.prod \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.aigenetreemobile.prod \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac