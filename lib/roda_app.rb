require "roda"

class RodaApp < Roda
  route do |r|
    r.get do
      MESSAGE
    end
  end
end
