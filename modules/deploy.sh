#!/usr/bin/env bash

APPLICATION_NAME=$0

printHelp() {
  echo "usage: "${APPLICATION_NAME}" <environment>"
  exit 1
}

if [[ -z "$1" ]]; then
  printHelp
fi

ENVIRONMENT=$1
ACCOUNT_ID=$(aws sts get-caller-identity | jq -r .Account)

rm -rf .terraform

terraform12 init -input=false -backend-config="bucket=${ACCOUNT_ID}-${ENVIRONMENT}-terraform-state" \
    -backend-config="dynamodb_table=${ACCOUNT_ID}-${ENVIRONMENT}-terraform-state-lock"

terraform12 apply -auto-approve -input=false \
 -var "env=${ENVIRONMENT}" \
 -var "account_id=${ACCOUNT_ID}"
