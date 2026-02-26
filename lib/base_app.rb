# base_app.rb
require 'bundler'
Bundler.require 

class BaseApp < Sinatra::Base
  set :views, File.join(settings.root, '..', 'views')  
  beni_books = File.expand_path('../books', __dir__)
  # beni_books would be the actually destination on your local disk.
  
  configure :development do
    register Sinatra::Reloader
    # hot reloader
  end
end 

