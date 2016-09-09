MESSAGE = "Hello world!"

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require "sinatra_app"
require "roda_app"
require "rack_app"
require "nyny_app"
require "ramaze_app"
require "grape_app"

run Proc.new { |env| ["200", {"Content-Type" => "text/html"}, [MESSAGE]] }

map "/sinatra" do
  run SinatraApp
end

map "/roda" do
  run RodaApp.freeze.app
end

map "/rackapp" do
  run RackApp
end

map "/nyny" do
  run NyNyApp.new
end

map "/ramaze" do
  Ramaze.start(:file => __FILE__, :started => true)
  run Ramaze
end

map "/grape" do
  run GrapeApp
end
