require_relative 'base_app'

class UploaderApp < BaseApp
  post '/' do
    tempfile = params[:file][:tempfile]

    name = File.basename(params[:file][:filename])
    p hash = Digest::MD5.file(tempfile).hexdigest

    beni_books = File.join(__dir__, '../books/')
    final_dest = File.join(beni_books, name)
    FileUtils.cp tempfile.path, final_dest
    
    db = SQLite3::Database.open(File.expand_path('../db/data.db', __dir__))    
    db.execute <<-SQL, [hash, final_dest, name]
    INSERT INTO beni (hash, final_dest, name) 
    VALUES (?, ?, ?)
    ON CONFLICT(hash) DO NOTHING
    SQL
    
    redirect '/'
  end
end
