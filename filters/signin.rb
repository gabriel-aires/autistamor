class SignIn < Scrivener
  attr_accessor :email
  attr_accessor :password
  attr_accessor :user

  def validate
    assert_email :email
    assert_authenticated if assert_present :password
  end

  private def assert_authenticated
    user = User.find(email: email).first
    auth = !!user ? SCrypt::Password.new(user.secret) == password : false
    assert(auth, [:password, :not_correct)
  end
end
