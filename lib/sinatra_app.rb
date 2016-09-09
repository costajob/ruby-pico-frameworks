require 'sinatra/base'

class SinatraApp < Sinatra::Base
  get '/' do
    MESSAGE
  end
end
