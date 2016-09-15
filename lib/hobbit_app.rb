require "hobbit"

class HobbitApp < Hobbit::Base
  get "/" do
    MESSAGE
  end
end
