# `tf_aws_centos_ami`

Terraform module to get CentOS AMIs, because CentOS doesn't publish the list anywhere
publicly, and the ["recommended"](https://wiki.centos.org/Cloud/AWS) way to instantiate
their images is through AWS MarketPlace.

This list is provided as-is, and I make no warranties about its validity or currency.

## Input Variables

All input variables have default values, but we recommend specifying all of them:

* `region`, e.g., `eu-central-1`;
* `release`, e.g., `6.0` or `7.0`; and
* `virttype`, e.g., `hvm` or `pv`.

All images are assumed to be `x86-64`.

## Output Variable

There is only one output, named `ami_id`, which can be used directly on the
`ami_id` attribute on `aws_instance` stanzas.

## Example

```terraform
module "centos_ami" {
  source = "github.com/ripta/tf_aws_centos_ami"
  region = "us-west-2"
  release = "7.0"
  virttype = "hvm"
}

resource "aws_instance" "web" {
  count = 5
  ami = "${module.centos_ami.ami_id}"
  instance_type = "m4.large"
}
```

## Note

The process of updating `amis.tf.json` is painfully manual. You are welcome to
submit a pull request to update said JSON. In the PR, please include the source
URL, where you retrieved the AMI IDs, so that we can spot-check them.

If CentOS decides to publish a list of AMI IDs, PRs to automate this process is
very much appreciated.
