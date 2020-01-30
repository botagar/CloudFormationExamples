#!/bin/bash

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

echo ""
echo "To connect to the kubernetes cluster, run the proxy server. The proxy server can be started with 'kubectl proxy'"
echo "Once the proxy has been started, go to: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login"
echo "Use the token above to sign in as admin"
echo ""
