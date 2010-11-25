require "rubygems"
require "bundler/setup"

require 'active_support'

require 'mysql2'
require 'active_record'

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'castronaut'))

require 'sinatra'

require 'simple_cas'
Castronaut.config = Castronaut::Configuration.load

run SimpleCas