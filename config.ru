require 'bundler'
Bundler.require

require_relative './lib/base_app.rb'
require_relative './lib/views_app.rb'
require_relative './lib/uploader_app.rb'

run BaseApp
# start the base app for Beni

map '/' do
  run ViewsApp
end
