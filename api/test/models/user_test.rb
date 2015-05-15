require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validates of" do
    user = User.new
    assert_not user.valid?, 'not save for empty data'

    user.name = "Érico"
    assert_not user.valid?, 'not save for empty email and password'

    user.password = "123"
    assert_not user.valid?, 'not save for empty email'

    user.email = "e"
    assert_not user.valid?, 'not save for invalid email'

    user.email = "e@d.com"
    assert_not user.valid?, 'not save for small password'

    user.password = "123123"
    assert user.valid?, 'save for complete data'
  end
end
