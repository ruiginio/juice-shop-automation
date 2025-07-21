#!/bin/bash

# Helm variables

JUICE_SHOP_DEPLOYMENT_NAME="juice-shop-deployment"
JUICE_SHOP_SERVICE_NAME="juice-shop-service"
JUICE_SHOP_IMAGE_REPO="bkimminich/juice-shop"

# Not adding tests as running minikube in Linux and MacOS differ in so many levels

# Checking if helm chart path is in correct relative path

JUICE_PATH="./juice-shop-chart"
if [ ! -d "$JUICE_PATH" ]; then
    echo "Error: Helm chart directory not found at '$JUICE_PATH'. Please ensure the 'juice-shop-chart' folder is in the same directory as this script."
    exit 1
fi

helm upgrade --install my-juice-shop "$JUICE_PATH" \
  --set deploymentName="${JUICE_SHOP_DEPLOYMENT_NAME}" \
  --set serviceName="${JUICE_SHOP_SERVICE_NAME}" \
  --set image.repository="${JUICE_SHOP_IMAGE_REPO}"

if [ $? -ne 0 ]; then
    echo "Error deploying OWASP Juice Shop with helm"
    exit 1
fi

# minikube tunnel (macOS, differemt terminal window)

sleep 5

echo "--- Verifying Juice Shop Deployment ---"
kubectl get deployments "${JUICE_SHOP_DEPLOYMENT_NAME}"
kubectl get services "${JUICE_SHOP_SERVICE_NAME}"
kubectl get ingress --all-namespaces | grep "juice"
