#!/bin/bash

###################################################################
# Author : Pravin Hiremath
# Date : 05-03-2025
#
# This scripts reports the aws resource usage
#
# Version : V1 
#
# #################################################################

set -x

#AWS EC2 instances
#AWS S3 bucket
#AWS lambda functions
#AWS IAM users


#list the AWS EC2 instances
echo "print the aws ec2 instnaces"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker

#list the AWS S3 bucket
echo "print the aws s3 bucket"
aws s3 ls > resourceTracker

#list the AWS Lambda functions
echo "print the aws lambda functions"
aws lambda list-functions > resourceTracker

#list the AWS IAM users
aws iam list-users > resourceTracker
