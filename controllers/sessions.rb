class Sessions < Cuba; end

Sessions.define do
  on get do
    on "login", root do
      render "sessions/login"
    end
  end
end
