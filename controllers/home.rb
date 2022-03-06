class Home < Cuba; end

Home.define do
  on get do
    on root do
      render "index"
    end
  end
end
