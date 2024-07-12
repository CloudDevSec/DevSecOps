import boto3

def restore_from_backup(backup_date):
    s3 = boto3.client('s3')
    backup_bucket = 'my-backup-bucket'
    backup_file = f'backup-{backup_date}.txt'
    
    obj = s3.get_object(Bucket=backup_bucket, Key=backup_file)
    backup_content = obj['Body'].read().decode('utf-8')
    print(f'Restored content: {backup_content}')

# Example usage
restore_from_backup('2024-07-03')
