# selinux_config Module
[![Build Status](https://travis-ci.org/Adaptavist/puppet-selinux_config.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-selinux_config)

## Overview

The **nselinux_config** module handles the configuration of selinux modules
It is designed to be used alongside the ***Adaptavist/puppet-selinux*** puppet module

### Configuration

`$mode`

$mode (enforced|permissive|disabled) - sets the operating state for SELinux.

`$modules`

See selinux module define for details [https://github.com/Adaptavist/puppet-selinux/blob/master/manifests/module.pp]

## Dependencies

This module depends on the Adaptavist/puppet-selinux module.