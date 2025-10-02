# Origoss Homework Project - Installation Instructions

## Prerequisites

Make sure you have the following installed on your system:

- **Go** (v1.21 recommended)
  ```bash
  go version
  ```
- **Docker**
  ```bash
  docker --version
  ```
- **kubectl** (Kubernetes CLI)
  ```bash
  kubectl version --client
  ```
- **Terraform** (v1.3.0 or higher)
  ```bash
  terraform version
  ```
- A running **Kubernetes cluster** 
  ```bash
  kubectl cluster-info
  ```

## Clone the Repository

```bash
git clone https://github.com/miluivits/origoss-homework.git
cd origoss-homework
```

## Build and Run the HTTP Server Locally

```bash
cd origoss-homework
go build -o server main.go
./server
```

Test:
```bash
curl http://localhost:8080/
# Output: Hello, World!
```

## Dockerize the HTTP Server

Build Docker image:
```bash
docker build -t miluivits/origoss-homework:latest .
```

Run the Docker container:
```bash
docker run -p 8080:8080 miluivits/origoss-homework:latest
```

Test:
```bash
curl http://localhost:8080/
# Output: Hello, World!
```

## Push Docker Image to Docker Hub

```bash
docker login
docker push miluivits/origoss-homework:latest
```

## Deploy to Kubernetes Using YAML

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Check pods and service:
```bash
kubectl get pods
kubectl get svc
```

Access the service (replace `<NODE_PORT>` with the port from `kubectl get svc`):
```bash
curl http://<KUBE_NODE_IP>:<NODE_PORT>/
# Output: Hello, World!
```

## Deploy to Kubernetes Using Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Check outputs:
```bash
terraform output
```

Access the deployed service:
```bash
curl http://<KUBE_NODE_IP>:<service_node_port>/
# Output: Hello, World!
```

## Cleanup (Important!)

```bash
terraform destroy
minikube stop
