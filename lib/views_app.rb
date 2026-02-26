require_relative 'base_app'

class ViewsApp < BaseApp
  register Sinatra::Namespace
  
  get '/' do
    redirect '/bookstore/'
  end

  get '/publish' do
    erb :publish
  end
  
  namespace '/bookstore' do
    get '/book/:id' do
      # replace this with sqlite3
      @id = params[:id]
      erb :bookid
    end
    
    get '/' do
      # this is /bookstore/
      erb :bookstore
    end
    
    get '' do
      redirect '/'
    end
    
    get '/book' do
      redirect '/'
    end
    
    get '/book/' do
      # book/ no id
      redirect '/'
    end
  end
  
  not_found do
    status 404
      File.read(File.join(__dir__, '../views/oops.html'))
    end
end
