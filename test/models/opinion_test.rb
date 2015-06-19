require 'test_helper'

class OpinionTest < ActiveSupport::TestCase

  def setup
    @user = User.create( name: "Example User", email: "user@example.com",
                     password: "foobar")
  end

  test "validates of Opinion" do
    opinion = Opinion.new

    assert_not opinion.valid?, 'not save for empty data'

    opinion.description = "teste"
    assert_not opinion.valid? 'not save for min length'

    opinion.description = "A faculdade precisa de um xerox"
    assert_not opinion.valid?, 'not save for user_id'

    opinion.user_id = @user.id
    assert opinion.valid?, 'save for complete data'

    opinion.save!
    assert_not opinion.user.name.nil?, 'Opinion saved user'
  end
end
