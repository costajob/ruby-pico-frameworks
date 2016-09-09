require "grape"

class GrapeApp < Grape::API
  format :txt

  get do
    MESSAGE
  end
end
