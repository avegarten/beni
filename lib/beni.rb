require 'sinatra'
require 'fileutils'
require 'json'
require 'sqlite3'

# setup
set :bind, '0.0.0.0'
set :port, 9000
beni_store = "#{Dir.pwd}/books"
# beni_store would be the actually destination on your local disk.
# yeah, and check if this is still right after now beni.rb is in /lib

# sqlite for uploading book metadata, yeah. add this some time soon but its like, 2am and im going to bed instead


get '/' do
  File.read(File.join(__dir__, '../views/index.html'))
  # please please please change this to erb
end

not_found do
  status 404
  File.read(File.join(__dir__, '../views/oops.html'))
  # also here, please please please change this to erb
end
