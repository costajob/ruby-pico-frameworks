require "syro"

SyroApp = Syro.new do
  get do
    res.write MESSAGE
  end
end
