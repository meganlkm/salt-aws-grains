import os
import boto3


def aws_grains():
    return {
        'aws_account_id': boto3.client('sts').get_caller_identity()['Account'],
        'aws_region': os.getenv('AWS_REGION', 'us-west-1')
    }
