Description
===========

orch\_web is a simple cookbook for setting up databases with a primary
user/role. It uses the resources from the
[database](https://github.com/opscode-cookbooks/database) cookbook for
configuration.

The goal is to provide a simple way to set up databases by just setting
a few node attributes. No custom cookbook required.

Requirements
============

Chef 10.10.0+

Assumptions
-----------

* You are using either mysql or postgres
* You only need one user/role per database

Platform
--------

* Ubuntu

Tested on:

* Ubuntu 12.04

Cookbooks
---------

This cookbook depends on the following external cookbook:

* [database](https://github.com/opscode-cookbooks/database)

Attributes
==========

### db\_type

The specific database system to install. Either "postgres" or "mysql".
Defaults to "postgres".

### databases

A list of hashes describing a database + user. Each hash accepts the
following:

* name - the name of the database
* user - the name of the user/role
* password - the user/role password

Usage
=====

* Add recipe[orch\_db] to the run list for your database node and set the
  db\_type and database attributes

License and Author
==================

- Author:: Jeff Siegel

Copyright:: 2012 Jeff Siegel

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
