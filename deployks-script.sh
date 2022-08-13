   az acr create --resource-group acdnd-c4-project --name myacr202208 --sku Basic
 az acr login --name myacr202208 
   az acr show --name myacr202208 --query loginServer --output table
   docker push myacr202208.azurecr.io/azure-vote-front:v1
   az acr repository list --name myacr202208 --output table
   az aks update -n udacity-cluster -g acdnd-c4-project --attach-acr myacr202208

   az acr show --name myacr202208 --query loginServer --output table

az aks command invoke --resource-group acdnd-c4-project --name udacity-cluster --command "kubectl get pods -n kube-system"

az aks command invoke --resource-group acdnd-c4-project --name udacity-cluster --command "kubectl apply -f azure-vote-all-in-one-redis.yaml" --file azure-vote-all-in-one-redis.yaml

az aks command invoke --resource-group acdnd-c4-project --name udacity-cluster --command "   kubectl set image deployment azure-vote-front azure-vote-front=myacr202208.azurecr.io/azure-vote-front:v1"

az aks command invoke --resource-group acdnd-c4-project --name udacity-cluster --command "kubectl get service"

az aks command invoke --resource-group acdnd-c4-project --name udacity-cluster --command "kubectl get pods"




