require 'bundler'
Bundler.require 

class BaseApp < Sinatra::Base
  set :views, File.join(settings.root, '..', 'views')  
  
  configure :development do
    register Sinatra::Reloader
    # hot reloader
  end
  
  db = SQLite3::Database.open(File.expand_path('../db/data.db', __dir__))
  db.execute <<~SQL
    CREATE TABLE IF NOT EXISTS beni(
        hash TEXT PRIMARY KEY,
        path TEXT NOT NULL,
        original_name TEXT NOT NULL
    );
  SQL
end 
