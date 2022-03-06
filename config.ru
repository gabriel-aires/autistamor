require "cuba"

Cuba.define do
  on get, "articles" do
    res.write "Hello from Artickes#index!"
  end
end

run Cuba
