#!/bin/bash

curl –sfL https://rancher-mirror.oss-cn-beijing.aliyuncs.com/k3s/k3s-install.sh | \
     INSTALL_K3S_MIRROR=cn sh -s - --docker \
     --system-default-registry "registry.cn-hangzhou.aliyuncs.com"
