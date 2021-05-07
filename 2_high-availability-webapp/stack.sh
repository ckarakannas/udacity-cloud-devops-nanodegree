#!/bin/bash
# Shell script for creating, updating or deleting an AWS CloudFormation Stack
# Author: Chris Karakannas, May 2021
###### Parameters ########
# 1. Stack command to perform - Required. Options available include - update | create | delete
# 2. Stack name. - Required.
# 3. Template file. Conditional.
# 4. Parameters file. Conditional
# 5. AWS Region. Optional. Defaults to "eu-west-2" if no argument is provided

COMMAND=$1
STACK_NAME=$2
TEMPLATE_FILE=$3
PARAMS_FILE=$4
INPUT_REGION=$5

region=${INPUT_REGION:-"eu-west-2"}

print_usage() {
  printf '\nInvalid input error: Usage: stack.sh <create|update|delete> <stack-name> <template-body> <params-file>\n'
}

case ${COMMAND} in
  update)
    aws cloudformation update-stack --stack-name ${STACK_NAME} --template-body file://${TEMPLATE_FILE} --parameters file://${PARAMS_FILE} --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=${region} ;;
  create)
    aws cloudformation create-stack --stack-name ${STACK_NAME} --template-body file://${TEMPLATE_FILE} --parameters file://${PARAMS_FILE} --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=${region} ;;
  delete)
    aws cloudformation delete-stack --stack-name ${STACK_NAME} --region=${region} ;;
  *)
    print_usage
    exit 1 ;;
esac

exit 0
