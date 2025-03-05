#!/bin/bash

# Set PATH (include AWS CLI path)
export PATH="/usr/local/bin:/usr/bin:/bin"

# Set AWS credentials paths (modify if needed)
export AWS_CONFIG_FILE="/home/ubuntu/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="/home/ubuntu/.aws/credentials"

# Define AWS CLI full path
AWS_CLI="/usr/local/bin/aws"

OUTPUT_FILE="/home/ubuntu/praveen/aws_resource_tracker_project/resourceTracker"

{
  echo "=============================="
  echo "AWS Resource Tracker Log - $(date)"
  echo "=============================="

  echo "AWS EC2 Instances:"
  $AWS_CLI ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output json || echo "Error fetching EC2 instances"
  echo -e "\n"

  echo "AWS S3 Buckets:"
  $AWS_CLI s3 ls || echo "Error fetching S3 buckets"
  echo -e "\n"

  echo "AWS Lambda Functions:"
  $AWS_CLI lambda list-functions --query "Functions[*].FunctionName" --output json || echo "Error fetching Lambda functions"
  echo -e "\n"

  echo "AWS IAM Users:"
  $AWS_CLI iam list-users --query "Users[*].UserName" --output json || echo "Error fetching IAM users"
  echo -e "\n"

  echo "AWS Resource tracking completed at $(date)"
  echo "-------------------------------------------"
} >> "$OUTPUT_FILE" 2>&1

