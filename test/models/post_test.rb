require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user=users(:michael)
    @category=categories(:study)
    @post=@user.posts.new(title: "aaa",url: "aaaaa",category_id: @category.id)
  end
  test "should be valid" do
    assert @post.valid?
  end
  test "user_id should be present" do
    @post.user_id=nil
    assert_not @post.valid?
  end
  test "url should be present" do
    @post.url="   "
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
  
end
