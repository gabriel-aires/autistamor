#load dependencies
require "cuba"
require "cuba/safe"
require "cuba/render"
require "hamlit"
require "ohm"

#configuration
Cuba.use Rack::Session::Cookie, :secret => "|HU¨%$j89jafdiojiH*H#ld(@Çççd~O@!Q)"
Cuba.use Rack::Static, :urls => ["/css", "/js", "/img"], :root => "./assets"
Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "haml"
Cuba.settings[:render][:views] = "./views/"
Cuba.settings[:render][:layout] = "layout"
Ohm.redis = Redic.new("unix:/run/redis/redis.sock")

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
