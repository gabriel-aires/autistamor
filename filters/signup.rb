class SignUp < Scrivener
  attr_accessor :email
  attr_accessor :secret
  attr_accessor :confirmation

  def validate
    assert_email :email
    assert_hashed if assert_present :secret
  end

  private def assert_hashed
    @secret = SCrypt::Password.create(@secret)
    assert @secret == @confirmation, [:confirmation, :not_equal]
  end
end
