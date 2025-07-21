# juice-shop-automation
Automate OWASP Juice Shop deployment using Minikube (MacOS)

## Prerequisites

Install Minikube (MacOS)

`brew install minikube`

Install Docker Desktop (if not already installed)

https://docs.docker.com/desktop/setup/install/mac-install/

Start minikube

`minikube start`

Add minikube addons (ingress)

`minikube addons enable ingress`
`minikube addons enable ingress-dns`


## Deploy Juice Shop on Minikube (MacOS)

Install helm (if not already installed)

`brew install helm`

Map the domain to 127.0.0.1 in /etc/hosts instead of minikube ip (MacOS)

Run the script **deploy-juice-shop.sh** in the same folder as the helm chart

`./deploy-juice-shop.sh`

Run minikube tunnel in differet terminal window to expose the service (MacOS)

`minikube tunnel`

Check if service is up and open http://juice-shop.local/ in web browser



