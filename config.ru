MESSAGE = "Hello world!"

Dir[File.expand_path("../lib/*.rb", __FILE__)].each do |app|
  require app
end

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

map "/camping" do
  run CampingApp
end

map "/hobbit" do
  run HobbitApp
end
