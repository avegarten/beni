require_relative 'base_app'

class UploaderApp < BaseApp
  # post '/upload' do
  # # i mean, in the end it should upload
  # end
  beni_books = File.expand_path('../books', __dir__)
  # beni_books would be the actually destination on your local disk.

end


#post /upload here and save to disk (OBJECTIVE)


#if this works, ill honestly be surprised. 