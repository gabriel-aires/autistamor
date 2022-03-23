class Home < Cuba; end

Home.define do

  @title = "Autistamor"
  @description = "Informação e entretenimento para quem pensa fora da caixa"

  on get do
    on root do
      render "index"
    end
  end

end
