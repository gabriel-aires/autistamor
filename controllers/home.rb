class Home < Cuba; end

Home.define do
  on get, root do
    render "index"
  end
end
