cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: disk-clean
  namespace: test
spec:
  restartPolicy: Never
  nodeName: $1
  volumes:
  - name: rook-data-dir
    hostPath:
      path: /var/lib/rook
  containers:
  - name: disk-clean
    image: busybox
    securityContext:
      privileged: true
    volumeMounts:
    - name: rook-data-dir
      mountPath: /node/rook-data
    command: ["/bin/sh", "-c", "rm -rf /node/rook-data/*"]
EOF