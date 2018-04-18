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
# List of objects variables for AWS Cloudtrail  / Cloudtrail trails
trail_name = attribute('trail.name', description: '')
s3 = attribute('s3bucket.name', description: '')
tr_arn_id = attribute('trail_arn.id', description: '')
cw_logs_rarn = attribute('cloudwatch_logs_role.arn', description: '')
cw_logs_garn = attribute('cloudwatch_logs_log_group.arn', description: '')
kms_key = attribute('kms_key.id', description: '')
region = attribute('home_region.id', description: '')
# Attributes for the Trails
trails_count = attribute('cloudtrail.entries', description: '')
trails_name = attribute('cloudtrail.name.list', description: '')
tr_arns = attribute('cloudtrail.arn.list', description: '')


# Controls here
# For security measures the test enforced encryption, log validation and multi-region on the log file.
control 'monitoring-01' do
  impact 1.0
  title 'Cloudtrail validation'
  desc 'This test covers only 1 trail and should be copied for each trail that need to be tested'
describe aws_cloudtrail_trail(trail_name) do
  it { should be_log_file_validation_enabled }
  it { should be_encrypted }
  it { should be_multi_region_trail }
  its('s3_bucket_name') { should eq (s3) }
  its('trail_arn') { should cmp (tr_arn_id) }
  its('cloud_watch_logs_role_arn') { should include (cw_logs_rarn) }
  its('cloud_watch_logs_log_group_arn') { should include (cw_logs_garn) }
  its('kms_key_id') { should include (kms_key) }
  its('home_region') { should include (region) }
 end
end

control 'monitoring-02' do
  impact 1.0
  title 'Cloudtrail - Delivery time is recent'
  desc 'This test ensure the latest delivery time was recent'
  describe aws_cloudtrail_trail(trail_name) do
    its('delivered_logs_days_ago') { should eq 0 }
  end
end

control 'monitoring-03' do
  impact 1.0
  title 'Cloudtrail - Validation over the trails list'
  desc 'This is to validate specific values within the trails list'
  describe aws_cloudtrail_trails do
    its('names') { should include(trails_name) }
    its('trail_arns') { should include(tr_arns) }
 end
end

control 'monitoring-04' do
  impact 1.0
  title 'Cloudtrail - Maximum Cloudtrail Trails allowed'
  desc 'Simply validate a maximum number of Cloudtrail Trails within an AWS account.'
  describe aws_cloudtrail_trails do
    its('entries.count') { should be <= (trails_count)}
 end
end
# # List of objects variables for AWS Cloudwatch Alarm
# webserver_id = attribute('ec2_instance.webserver', description: '')
# ec2_ami_id = attribute('ec2_instance.webserver.ami', description: '')
# ec2_type = attribute('ec2_instance.webserver.instance_type', description: '')
# vpc_identifier = attribute('vpc.id', description: '')
#
# # List of objects variables for AWS Cloudwatch log metric filter
# webserver_id = attribute('ec2_instance.webserver', description: '')
# ec2_ami_id = attribute('ec2_instance.webserver.ami', description: '')
# ec2_type = attribute('ec2_instance.webserver.instance_type', description: '')
# vpc_identifier = attribute('vpc.id', description: '')
#
# # List of objects variables for AWS Config Recorder
# webserver_id = attribute('ec2_instance.webserver', description: '')
# ec2_ami_id = attribute('ec2_instance.webserver.ami', description: '')
# ec2_type = attribute('ec2_instance.webserver.instance_type', description: '')
# vpc_identifier = attribute('vpc.id', description: '')

# Controls here.
