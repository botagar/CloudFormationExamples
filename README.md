# Reference Templates

# Examples
## EKS
Yes, it's an EKS example. 

To create an instance of this example, run: `control.sh -a create -p eks-demo -e local`.

To delete this instance, run: `control.sh -a destroy -p eks-demo -e local`.

NOTE: The networking template in this example has a small deviation from the reference networking template. In order to accomodate EKS, the subnets have an added extra tag.