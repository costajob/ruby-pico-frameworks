require "hobbit"

class HobbitApp < Hobbit::Base
  get "/" do
    "Hello World!"
  end
end
