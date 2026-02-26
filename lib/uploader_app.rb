require_relative 'base_app'

class UploaderApp < BaseApp
  post '/' do
    tempfile = params[:file][:tempfile]
    name = File.basename(params[:file][:filename])
    digest = Digest::MD5.file(tempfile).hexdigest
    # example "177ff1d368916a567c896c0c3a2d7bc4"
    
    final_dest = File.join('/home/avery/Work/ruby/sinatra/beni/books/', name)
    FileUtils.cp tempfile.path, final_dest
  end
end