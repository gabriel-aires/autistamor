class SignIn < Scrivener
  attr_accessor :email
  attr_accessor :secret
  attr_accessor :user

  def validate
    assert_email :email
    assert_authenticated if assert_present :secret
  end

  private def assert_authenticated
    user = User.find(email: email).first
    auth = !!user ? SCrypt::Password.new(user.secret) == @secret : false
    assert(auth, [:password, :not_correct])
  end
end
