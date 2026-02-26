require_relative 'base_app'
require 'sinatra/namespace'


#use file name  

class ViewsApp < BaseApp
  register Sinatra::Namespace
# use class name for the < 
  get '/' do
    redirect '/bookstore'
  end

  get '/publish' do
    erb :publish
  end
  
  not_found do
    status 404
      File.read(File.join(__dir__, '../views/oops.html'))
      # also here, please please please change this to erb
  end

  namespace '/bookstore' do
    get '/book/:id' do
      # this is /bookstore/book/:id
      @id = params[:id]
      erb :bookid
      # independent book info pages. this is also very early testing.
    end
    
    get '/' do
      # this is /bookstore/
      File.read(File.join(__dir__, '../views/bookstore.html'))
      # testing for now, just turn this into erb soon when uploads work
    end
  end
end

#if this works, ill be surprised. 