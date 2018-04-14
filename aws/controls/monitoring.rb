# encoding: utf-8
# copyright: 2018, The Authors

title 'Dynamic test - AWS Services; Monitoring tools'
# ref
# https://www.inspec.io/docs/reference/resources/aws_cloudtrail_trail
# https://www.inspec.io/docs/reference/resources/aws_cloudtrail_trails
# https://www.inspec.io/docs/reference/resources/aws_cloudwatch_alarm
# https://www.inspec.io/docs/reference/resources/aws_cloudwatch_log_metric_filter
# https://www.inspec.io/docs/reference/resources/aws_config_recorder

# Attributes here.
content = inspec.profile.file("monitoring-config.JSON")
params = JSON.parse(content)
# body_content = attribute('body.content', description: 'Expected content in the body of the target')



# Controls here.
