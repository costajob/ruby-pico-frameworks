require "rack/app"

class RackApp < Rack::App
  get "/" do
    MESSAGE
  end
end
