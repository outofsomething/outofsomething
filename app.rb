#!/usr/bin/env ruby
# encoding: UTF-8
# run with the command 'rackup'
require 'sinatra/base'

class OutOfSomething < Sinatra::Base
  set :root, File.dirname(__FILE__) # You must set app root
  configure do
    set :site_name, "Out of Something, LLC"
  end

  get '/' do
    erb :index, :locals => {}
  end
end
