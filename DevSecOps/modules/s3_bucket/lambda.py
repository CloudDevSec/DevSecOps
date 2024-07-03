import boto3
import datetime

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    backup_bucket = 'my-backup-bucket'
    backup_file = f'backup-{datetime.datetime.now().strftime("%Y-%m-%d")}.txt'
    
    # Example backup content
    backup_content = 'This is a backup.'
    
    s3.put_object(Bucket=backup_bucket, Key=backup_file, Body=backup_content)
    return {'statusCode': 200, 'body': 'Backup successful'}
