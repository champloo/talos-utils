Some handy talso utils for cleaning disks when doing a reinstall of talos or cleaning up ceph storage data.

Create namespace that has privileged access
`kubectl apply -f namespace.yaml`

Use `disk-clean-meta.yaml` to remove metadata from talos node. Use this on both control plane and worker nodes

Handy command below that executes the script, waits for it to apply and then deletes the pod
`./disk-clean-meta.sh talos-node-name && kubectl wait --timeout=900s --for=jsonpath='{.status.phase}=Succeeded' pod disk-clean -n test && kubectl delete pod disk-clean -n test`

Use `disk-wipe.yaml` to wipe an entire disk

Handy command below that executes the script, waits for it to apply and then deletes the pod
`./disk-wipe.sh talos-node-name && kubectl wait --timeout=900s --for=jsonpath='{.status.phase}=Succeeded' pod disk-wipe -n test && kubectl delete pod disk-wipe -n test`

