#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

temp_dir=$(mktemp -d)

pushd $temp_dir

git clone https://github.com/vmware-tanzu/community-edition

pushd community-edition

./test/build-tce.sh

./test/install-dependencies.sh

# run docker management + workload cluster test like this -
# ./test/docker/run-tce-docker-managed-cluster.sh
# or use below make target! :)
make docker-management-and-cluster-e2e-test
