require 'bundler'
Bundler.require 

class BaseApp < Sinatra::Base
  set :views, File.join(settings.root, '..', 'views')  
  
  configure :development do
    register Sinatra::Reloader
    # hot reloader
  end
end 

