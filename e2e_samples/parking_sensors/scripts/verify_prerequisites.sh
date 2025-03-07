#!/bin/bash

# Check if required utilities are installed
command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq but it's not installed. See https://stedolan.github.io/jq/.  Aborting."; exit 1; }
command -v az >/dev/null 2>&1 || { echo >&2 "I require azure cli but it's not installed. See https://bit.ly/2Gc8IsS. Aborting."; exit 1; }
command -v databricks >/dev/null 2>&1 || { echo >&2 "I require databricks cli but it's not installed. See https://github.com/databricks/databricks-cli. Aborting."; exit 1; }

# Check if user is logged in
# If user is not logged in then abort and guide them to look at the Readme file
[[ -n $(az account show 2> /dev/null) ]] || { echo "Please login via the Azure CLI and restart the deployment. Check the prerequisites in the Readme. Aborting."; exit 1; }
