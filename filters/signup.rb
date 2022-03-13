class SignUp < Scrivener
  attr_accessor :email
  attr_accessor :password
  attr_accessor :confirmation

  def validate
    assert_email :email
    assert_equal :password, confirmation if assert_present :password
  end
end
