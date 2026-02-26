require 'bundler'
Bundler.require

ENV['TMPDIR'] = "#{Dir.pwd}/TMPDIR"
FileUtils.mkdir_p ENV['TMPDIR']

require_relative './lib/base_app.rb'
require_relative './lib/views_app.rb'
require_relative './lib/uploader_app.rb'

map '/upload' do
  run UploaderApp
end

map '/' do
  run ViewsApp
end
