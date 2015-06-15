name             'chef_cfn'
maintainer       'Jonathan Serafini'
maintainer_email 'jonathan@serafini.ca'
license          'Apache 2.0'
description      'Chef integration with AWS cloudformation'
long_description 'Chef integration with AWS cloudformation'
version          '0.1.0'

depends "chef_handler"
depends "ohai"

# 
# Attributes
#
grouping "cfn",
  title: "Cloudformation",
  description: "Cloudformation namespace"

grouping "cfn/properties",
  title: "Cloudformation Properties",
  description: "Cloudformation metadata properties merged with cfn hint"

grouping "cfn/stack",
  title: "Cloudformation Stack",
  description: "Cloudformation Stack ohai namespace"

attribute "cfn/stack/autoscaling_name",
  display_name: "Autoscaling group name",
  description: "Name of the autoscaling group that spawn the instance",
  default: "ohai"

attribute "cfn/stack/logical_id",
  display_name: "Cloudformation stack logical id",
  description: "Cloudformation stack logical id",
  default: "ohai"

attribute "cfn/stack/stack_id",
  display_name: "Cloudformation stack id",
  description: "Cloudformation stack id",
  default: "ohai"

attribute "cfn/stack/stack_name",
  display_name: "Cloudformation stack name",
  description: "Cloudformation stack name",
  default: "ohai"

grouping "cfn/tags",
  title: "Cloudformation Tags",
  description: "Cloudformation Tags ohai namespace"

attribute "cfn/tools/hup/interval",
  title: "Scan interval",
  description: "cfn-hup will scan for metadata changes every N seconds",
  default: 10

attribute "cfn/tools/hup/verbose",
  title: "cfn-hup verbosity",
  description: "Should cfn-hup provide verbose output",
  default: false

attribute "cfn/tools/url",
  title: "Cloudformation init tools url",
  description: "Tarball url for cfn-init installation"

grouping "cfn/vpc",
  title: "Cloudformation VPC",
  description: "Cloudformation VPC ohai namespace"

attribute "cfn/vpc/region_id",
  display_name: "Aws Region id",
  description: "Aws region the instance belongs to",
  default: "ohai"

attribute "cfn/vpc/subnet_id",
  display_name: "Aws Subnet id",
  description: "Aws subnet the instance belongs to",
  default: "ohai"

attribute "cfn/vpc/vpc_id",
  display_name: "Aws VPC id",
  description: "Aws vpc the instance belongs to",
  default: "ohai"

#
# Recipes
#

recipe "chef_cfn::default",   "Installs dependencies"
recipe "chef_cfn::knife",     "(optional) Provides a basic knife.rb"
recipe "chef_cfn::ohai",      "Installs the ohai[cfn] plugin"
recipe "chef_cfn::handler",   "Installs a handler to signal cloudformation"
recipe "chef_cfn::mounts",    "Mounts cloudformation defined volumes"
recipe "chef_cfn::tools",     "Installs cloudformation cfn-init tools"
recipe "chef_cfn::shutdown",  "Installs a service which will delete the node"

#
# Resources
#
provides "chef_cfn::chef_cfn_signal"
