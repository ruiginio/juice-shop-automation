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

Create custom helm chart template

`helm create <chart-name>`

Edit **values.yaml** and other manifest under templates folder

Before running the depoloyment please check the following when running minikube in MacOS:
  - Domain is mapped to 127.0.0.1 in /etc/hosts instead of minikube ip (MacOS)
  - Service type is **LoadBalancer**
  - minukube ingress addons are enabled
  - run minikube tunnel to expose the service  

Clone the repo to your local folder

Give the deployment script the permissions to execute

**chmod +x deploy-juice-shop.sh**

Run the script **deploy-juice-shop.sh** in the same folder as the helm chart

`./deploy-juice-shop.sh`

Run minikube tunnel in differet terminal window to expose the service (MacOS)

`minikube tunnel`

Check if service is up and open http://juice-shop.local/ in web browser

**And you should good to go!**
