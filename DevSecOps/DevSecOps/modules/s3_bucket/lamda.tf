resource "aws_cloudwatch_event_rule" "backup_schedule" {
  name                = "backup-schedule"
  schedule_expression = "rate(24 hours)"
}

resource "aws_cloudwatch_event_target" "backup_target" {
  rule = aws_cloudwatch_event_rule.backup_schedule.name
  arn  = aws_lambda_function.backup_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.backup_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.backup_schedule.arn
}
