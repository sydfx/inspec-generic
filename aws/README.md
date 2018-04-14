# InSpec - AWS Cloud testing

Self-explanatory title ;-)

## Description

This part of the suite is dedicated to AWS, multiple controls will be included.

## Requirements

* at least [InSpec](http://inspec.io/) version 1.38.8
* Your AWS credentials (Access/Secret key)
* AWS CLI
* [Train](https://github.com/chef/train)

### Platform

- AWS

## Attributes

We will use a JSON attribute file to steer the configuration on the various tools to, sort of
make the tests more dynamic, we can always hardcode for more specific needs.

## Usage

InSpec makes it easy to run your tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

```

# run profile on remote AWS environment and directly from Github
$ inspec exec https://github.com/sydfx/inspec-generic/aws -t aws://prefered-region-1

# run profile on remote AWS environment
$ inspec exec aws -t aws://prefered-region-1
```

### Run individual controls

In order to verify individual controls, just provide the control ids to InSpec:

```
inspec exec aws --controls 'cloudtrail-01 secgroup-05'
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
