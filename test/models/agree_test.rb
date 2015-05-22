require 'test_helper'

class AgreeTest < ActiveSupport::TestCase
   def setup
  	@user = users(:one)
  	@comment = comments(:one)
  	@opinion = opinions(:one) 	
  end

  test "validates of Agree" do

  	agree = Agree.new
  	assert_not agree.valid?, 'Not valid for empty data'

  	agree.opinion_id = @opinion.id
  	assert_not agree.valid?, 'Not valid for empty user'

  	agree.comment_id = @comment.id
  	assert_not agree.valid?, 'Not valid for empty user'

  	agree.user_id = @user.id
  	assert agree.valid?, 'Valid for complete data'

  	assert_not agree.user.name.nil?, 'Valid for user not nil'

  	assert_not agree.opinion.id.nil?, 'Valid for opinion not nil'

  end
end
