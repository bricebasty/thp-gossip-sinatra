# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'controller'

Rack::Handler.default.run(ApplicationController, Port: 4567)
