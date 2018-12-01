## Resource to cover.

# aws_ebs_volume
# aws_ebs_volumes
# aws_ec2_instance
# aws_ec2_instances
# aws_eks_cluster
# aws_elb
# aws_elbs

# encoding: utf-8
# copyright: 2018, D.

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
