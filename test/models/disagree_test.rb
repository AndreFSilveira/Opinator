require 'test_helper'

class DisagreeTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  	@comment = comments(:one)
  	@opinion = opinions(:one) 	
  end

  test "validates of Disagree" do

  	disagree = Disagree.new
  	assert_not disagree.valid?, 'Not valid for empty data'

  	disagree.opinion_id = @opinion.id
  	assert_not disagree.valid?, 'Not valid for empty user'

  	disagree.comment_id = @comment.id
  	assert_not disagree.valid?, 'Not valid for empty user'

  	disagree.user_id = @user.id
  	assert disagree.valid?, 'Valid for complete data'

  	assert_not disagree.user.name.nil?, 'Valid for user not nil'

  	assert_not disagree.opinion.id.nil?, 'Valid for opinion not nil'

  end
end
