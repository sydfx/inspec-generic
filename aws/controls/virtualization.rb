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

title 'Dynamic test - AWS Services; Virtualization tools'
# ref
# https://www.inspec.io/docs/reference/resources/aws_ebs_volume/
# https://www.inspec.io/docs/reference/resources/aws_ebs_volumes/
# https://www.inspec.io/docs/reference/resources/aws_ec2_instance/
# https://www.inspec.io/docs/reference/resources/aws_ec2_instances/
# https://www.inspec.io/docs/reference/resources/aws_eks_cluster/
# https://www.inspec.io/docs/reference/resources/aws_elb/
# https://www.inspec.io/docs/reference/resources/aws_elbs/

# Attributes here.
# List of objects variables for EBS Volume  / EBS Volumes
volume_id = attribute('volume.id', description: '')
az = attribute('availability.zone', description: '')
ebs_size = attribute('size', description: '')
iops = attribute('iops', description: '')
snapshot_id = attribute('snapshot.id', description: '')
ebs_state = attribute('state', description: '')
type = attribute('volume.type', description: '')
kms_key = attribute('kms.key.id', description: '')
# Attributes for the Volumes
# entries = attribute('entries.count', description: '')
# volume_ids = attribute('volume.ids', description: '')



# Controls here
# For security measures the test enforced encryption, log validation and multi-region on the log file.
control 'monitoring-01' do
  impact 1.0
  title 'EBS Validation'
  desc 'This test covers only 1 EBS volume and should be copied for each volume that need to be tested'
describe aws_ebs_volume(volume_id) do
  it { should exist }
  it { should be_encrypted }
  its('availability_zone') { should eq (az) }
  its('size') { should cmp (ebs_size) }
  its('iops') { should cmp (iops) }
  its('snapshot_id') { should be (snapshot_id) }
  its('state') { should eq (ebs_state) }
  its('volume_type') { should eq (type) }
  its('kms_key_id') { should include (kms_key) }

 end
end
