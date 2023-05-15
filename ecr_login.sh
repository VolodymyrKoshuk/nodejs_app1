#!/bin/bash

ECR_REPOSITORY_URL="224974567407.dkr.ecr.eu-north-1.amazonaws.com/nodejs_app1"
REGION="eu-north-1"

TEMPORARY_PASSWORD=`aws ecr get-login-password --region "${REGION}"`

docker login -u AWS -p "${TEMPORARY_PASSWORD}" "${ECR_REPOSITORY_URL}"

echo "Login to ECR successful"
