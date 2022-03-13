# Load dependences first
require "dotenv/load"
require "sucker_punch"
require "cuba"
require "cuba/safe"
require "cuba/render"
require "hamlit"
require "ohm"

# Define environment
RACK_ENV = ENV['RACK_ENV'] ||= 'development'
REDIS_SERVER = ENV['REDIS_SERVER'] ||= "redis://127.0.0.1:6379"
SESSION_SECRET = ENV['SESSION_SECRET'] ||= "defca875057ca812bbda01233c8ddd3aa9f"

#configuration
Cuba.use Rack::Session::Cookie, :secret => SESSION_SECRET
Cuba.use Rack::Static, :urls => ["/css", "/js", "/img"], :root => "./assets"
Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "haml"
Cuba.settings[:render][:views] = "./views/"
Cuba.settings[:render][:layout] = "layout"
Ohm.redis = Redic.new REDIS_SERVER

#load sources
GLOB = "./{models,controllers}/*.rb"
Dir[GLOB].each { |file| require file }

#mount controllers
Cuba.define do

  on default do
    run Home
  end

end

#start server
run Cuba
