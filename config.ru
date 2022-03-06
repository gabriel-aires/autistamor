require "cuba"
require "cuba/render"
require "hamlit"
require "ohm"

Cuba.use Rack::Session::Cookie, :secret => "|HU¨%$j89jafdiojiH*H#ld(@Çççd~O@!Q)"

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render

Cuba.settings[:render][:template_engine] = "haml"
Cuba.settings[:render][:views] = "./views/"
Cuba.settings[:render][:layout] = "layout"

Ohm.redis = Redic.new("unix:/run/redis/redis.sock")

require "models/*"
require "controllers/*"

Cuba.define do
  on default { run Home }
end

run Cuba
