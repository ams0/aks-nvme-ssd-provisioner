# aks-nvme-ssd-provisioner
AKS NVMe disk provisioner to be used with the sig-storage-local-static-provisioner

Inspired by https://github.com/brunsgaard/eks-nvme-ssd-provisioner


To use, create an AKS cluster and attach a user nodepool with NVMe-enabled size and the `kubernetes.azure.com/aks-local-ssd` label:


```
az aks nodepool add -g <resourcegrou> --cluster-name <clustername> -n nvme -s Standard_L8s_v2 --labels kubernetes\.azure\.com\/aks-local-ssd=true -c 1
```

Apply the `storage-local-static-provisioner` (from this [repo](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner)) to create a storageClass and the PVs corresponding to the NVMe('s) present on the nodes:

```
kubectl apply -f manifests/storage-local-static-provisioner.yaml
```

The init container will prepare the NVMe disks for use, and the app container will create the PersistentVolumes to be used by your Pods.