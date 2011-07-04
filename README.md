KOBRA Client
============

Simple client for KOBRA.

## Requirments

* Ruby 1.9.2: kobra_client is only tested with Ruby 1.9.2, no garantees for other versions of Ruby.

## Install

Install via RubyGems

    gem install kobra_client

## Source

The source for kobra_client is available on Github:

    https://github.com/LinTek/kobra_client

### Development

kobra_client uses rspec and webmock for testing, do a `bundle install` for all the development requirements.

## Usage

kobra_client is a client to the KOBRA service at LiU (Linköpings Universitet).
A KOBRA account is needed to use this client.

### Initiate and authenticate

Get the username and API-key from your KOBRA account and use to authenticate the client.

    require 'kobra/client'
    kobra = Kobra::Client.new(:username => 'jage', :api_key => 'a9b8c7')
    # => #<Kobra::Client:0x00000101175898 @base_url="http://jage:a9b8c7@kobra.ks.liu.se/">

When we have the `kobra` instance, we can use the API.

### Lookup a LiU student

    kobra.get_student(:liu_id => 'johdoXXX')
    => {:blocked=>nil, :last_name=>"DOE", :email=>"johdoXXX@student.liu.se", :first_name=>"JOHN", :personal_number=>"887711-0011", :rfid_number=>"9999999999", :barcode_number=>"888888888888888", :union=>"LinTek", :liu_id=>"johdoXXX"}

## Copyright

Copyright (c) 2011 Johan Eckerström. See LICENSE for details.