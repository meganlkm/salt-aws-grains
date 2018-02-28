import os
import boto3


def aws_grains():
    rtn = {
        'aws': {
            'account_id': boto3.client('sts').get_caller_identity()['Account'],
            'region': os.getenv('AWS_REGION', 'us-west-1'),
        }
    }
    if os.getenv('AWS_ACCESS_KEY_ID'):
        rtn['access_key_id'] = os.getenv('AWS_ACCESS_KEY_ID')
    if os.getenv('AWS_SECRET_ACCESS_KEY'):
        rtn['secret_access_key'] = os.getenv('AWS_SECRET_ACCESS_KEY')
    return rtn
