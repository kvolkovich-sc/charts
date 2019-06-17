#!/usr/bin/env bash

set -e
set -o pipefail

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Upgrade dependencies
if [ -f $script_dir/requirements.yaml ]; then
   helm dependency build
fi

helm upgrade \
	 --install \
	 --force \
	 --namespace lunar-system \
	 velero \
	 $script_dir
