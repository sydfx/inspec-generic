# encoding: utf-8
# copyright: 2018, sydfx
# Reference: https://www.inspec.io/docs/reference/resources/docker/
# Reference: https://www.inspec.io/docs/reference/resources/docker_container/

title 'Docker tool suite'
# inspec exec https://github.com/dev-sec/linux-baseline -t docker://someContainerID
# This is to use the DevSec baseline to test a container.
# This test doesn't work without the argument "--attrs ../files/docker-config.yml"

# Attributes list
container_name = attribute('docker.name', description: '')
container = attribute('docker.container', description: '')
repository = attribute('docker.repo', description: '')
mapped_ports = attribute('docker.ports', description: '')
run_cmd = attribute('docker.command', description: '')
image = attribute('docker.image', description: '')
sha = attribute('docker.sha256', description: '')
container_id = attribute('docker.container.id', description: '')
tags = attribute('docker.tag', description: '')

# check if docker exists
only_if do
  command('docker').exist?
end

# # Docker container controls
control "docker-01" do
  impact 1.0
  title "Basics verification for a container"
  desc "Verify that the container run, have the right ports mapped and was started properly"
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe docker_container(container_name) do
  it { should exist }
  it { should be_running }
  its('ports') { should eq (mapped_ports) }
  its('command') { should eq (run_cmd) }
 end
end
control "docker-02" do
  impact 1.0
  title "Global validation of a container"
  desc "will come later"
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe docker_container(container_name) do
  it { should be_running }
  it { should exist }
  its('id') { should_not eq '' }
  its('id') { should eq (container_id) }
  its('image') { should eq (image) }
  its('repo') { should eq (repository) }
 end
end
control "docker-03" do
  impact 1.0
  title "Container ID validation"
  desc "will come later"
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
describe docker_container(id:(container)) do
  it { should exist }
  it { should be_running }
 end
end
# # Docker image controls
control "docker-04" do
  impact 1.0
  title " Validation of a docker image"
  desc "will come later"
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe docker_image(image) do
  it { should exist }
  its('id') { should_not eq '' }
  its('id') { should eq (sha) }
  its('repo') { should eq (repository) }
  its('tag') { should eq (tags) }
 end
end
