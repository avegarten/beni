require 'sinatra'
require 'fileutils'
require 'json'
require 'sqlite3'

# setup
set :bind, '0.0.0.0'
set :port, 9000
beni_store = "#{Dir.pwd}/books"
# beni_store would be the actually destination on your local disk.

get '/' do
  File.read('./views/index.html')
  # please change this to erb when you can.
end

# TODO: add a not_found route once the html/erb is setup for that
