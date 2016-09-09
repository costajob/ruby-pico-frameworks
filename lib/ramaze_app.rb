require "ramaze"

class RamazeApp < Ramaze::Controller
  def index
    MESSAGE
  end
end

Ramaze::Log.loggers.clear
