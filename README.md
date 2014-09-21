# Synkronos
[![Version      ](https://img.shields.io/gem/v/synkronos.svg?style=flat)](https://rubygems.org/gems/synkronos)
[![Build Status](https://img.shields.io/travis/akhramov/synkronos/master.svg?style=flat)](https://travis-ci.org/akhramov/synkronos)

    Synkronos is a life-time folder synchronization tool. 
    It's based on rsync and works only under MacOSX and Linux platforms yet.

## Installation
___
Your machine must have a working copy of rsync.

In order to sync through ssh you will need to setup RSA keys.


___
Add this line to your application's Gemfile:
```ruby
gem 'synkronos'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install synkronos

## Usage

* Syncing local directories:

        $ synkronos --src /path/to/src --dest /path/to/dest
___
* Syncing remote directory using ssh:

        $ synkronos --ssh --src /path/to/src --dest user@host:/path/to/dest
        
* Tracking changes in remote directory using ssh:

        $ synkronos --ssh --src user@host:/path/to/src --dest /path/to/dest
