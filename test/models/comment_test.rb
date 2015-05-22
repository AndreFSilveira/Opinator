require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  	@opinion = opinions(:one) 	
  end

  test "validates of Comment" do

  	comment = Comment.new
  	assert_not comment.valid?, 'Not valid for empty data'

  	comment.user_id = @user.id
  	assert_not comment.valid?, 'Not valid for empty opinion and description'

  	comment.opinion_id = @opinion.id
  	assert_not comment.valid?, 'Not valid for empty description'

  	comment.description = 'Teste'
  	assert_not comment.valid?, 'Not valid for comment is much short'

  	comment.description = 'Teste commentario longo'
  	assert comment.valid?, 'Valid for complete data'
  end
end
