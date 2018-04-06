# Various tools based on InSpec

Self-explanatory title ;-)

## Description

This [InSpec](https://github.com/chef/inspec) tools suite will be generated to comply various
common use cases.

InSpec is an open-source run-time framework and rule language used to specify compliance, security, and policy requirements for testing any node in your infrastructure.

## Requirements

* at least [InSpec](http://inspec.io/) version 1.38.8

### Platform

- Debian 8
- Ubuntu 16.04
- CentOS 7
- macOS

## Attributes

We will use a yml attribute file to steer the configuration on the various tools to, sort of
make them more dynamic tests, we can always hardcore for more specific needs. I will state a couple
of example here:

  * `docker.ports: 1234`
    define the expected ports.


## Usage

InSpec makes it easy to run your tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

```
# run profile locally
$ git clone https://github.com/dev-sec/cis-docker-benchmark
$ inspec exec cis-docker-benchmark

# run profile locally and directly from Github
$ inspec exec https://github.com/dev-sec/cis-docker-benchmark

# run profile on remote host via SSH
inspec exec cis-docker-benchmark -t ssh://user@hostname -i /path/to/key

# run profile on remote host via SSH with sudo
inspec exec cis-docker-benchmark -t ssh://user@hostname -i /path/to/key --sudo

# run profile on remote host via SSH with sudo and define attribute value
inspec exec cis-docker-benchmark --attrs sample_attributes.yml
```

### Run individual controls

In order to verify individual controls, just provide the control ids to InSpec:

```
inspec exec cis-docker-benchmark --controls 'control-01 control-02'
```


## License and Author

* Author:: David Guevremont <admin@mtlinfographie.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: http://travis-ci.org/dev-sec/cis-docker-benchmark
[2]: https://gitter.im/dev-sec/general
[3]: https://downloads.cisecurity.org/
