# encoding: utf-8
# copyright: 2018, sydfx

title 'Docker tool suite'
# inspec exec https://github.com/dev-sec/linux-baseline -t docker://someContainerID
# This is to use the DevSec baseline to test a container.
# This test doesn't work without the argument "--attrs ../files/attributes.yml"

# Attributes list
container_name = attribute('docker.name', description: 'The name of the container')
container = attribute('docker.container', description: 'The unique ID of the container')
repository = attribute('docker.repo', description: 'The repository where the docker image is coming from')
mapped_ports = attribute('docker.ports', description: 'The ports that the container should have mapped.')
run_cmd = attribute('docker.command', description: 'The command that the container should have been run with')
image = attribute('docker.image', description: 'Unique image ID')
sha256 = attribute('docker.sha256', description: 'Layers of a docker image are now identified by a digest, which takes the form algorithm:hex')
container_id = attribute('docker.container.id', description: 'Unique container ID')
tag = attribute('docker.tag', description: 'Tag associated with the docker image')

# check if docker exists
only_if do
  command('docker').exist?
end

# Controls starts here.
control "docker-01" do
  impact 1.0
  title "Basics verification for a container"
  desc "Verify that the container run, have the right ports mapped and was started properly"
  tag 'docker'
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
  tag 'docker'
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
  tag 'docker'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
describe docker_container(id:(container)) do
  it { should exist }
  it { should be_running }
 end
end
# # Docker image resource
control "docker-04" do
  impact 1.0
  title " Validation of a docker image"
  desc "will come later"
  tag 'docker'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe docker_image(image) do
  it { should exist }
  its('id') { should_not eq '' }
  its('id') { should eq (sha256) }
  its('repo') { should eq (repository) }
  its('tag') { should eq (tag) }
 end
end

# Can be used as an example if we want to exclude some old versions.
control "os-ctl-01" do
  impact 1.0
  title "Validate that the image of Ubuntu 12 isn't present on the machine"
  desc "Excluding old unused docker images"
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  tag data: "OS"
  tag "Ubuntu"
  describe docker_image('u12:latest') do
    it { should_not exist }
 end
end
