cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: disk-wipe
  namespace: test
spec:
  restartPolicy: Never
  nodeName: $1
  containers:
  - name: disk-wipe
    image: busybox
    securityContext:
     privileged: true
    command: ["/bin/sh", "-c", "dd if=/dev/zero bs=1M count=100 oflag=direct of=/dev/nvme0n1"]
EOF
