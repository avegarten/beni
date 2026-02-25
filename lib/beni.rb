require 'bundler'
Bundler.require

class Beni < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, 9000
  set :views, File.join(settings.root, '..', 'views')  
  beni_books = File.expand_path('../books', __dir__)

  # beni_books would be the actually destination on your local disk.
  # sqlite for uploading book metadata for /book/:id, yeah. add this some time soon but its like, 2am and im going to bed instead

  get '/' do
    status 201
    File.read(File.join(__dir__, '../views/index.html'))
    # please please please change this to erb
  end
  
  get '/book/:id' do
    @id = params[:id]
    erb :bookid
    # independent book info pages
  end
  
  not_found do
    status 404
      File.read(File.join(__dir__, '../views/oops.html'))
      # also here, please please please change this to erb
    end
end 

Beni.run!