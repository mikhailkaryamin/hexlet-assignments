require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment = @post.post_comments.create({
      body: post_comments(:one).body
    })
  end

  test "should get index" do
    get post_comments_url @post, @post_comment
    assert_response :success
  end

  test "should get new" do
    get new_post_comment_url @post, @post_comment
    assert_response :success
  end

  test "should create post_comment" do
    assert_difference("PostComment.count") do
      post post_comments_url(@post), params: { post_comment: { body: @post_comment.body } }
    end

    assert_redirected_to post_url(@post)
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @post_comment)
    assert_response :success
  end

  test "should update post_comment" do
    patch post_comment_url(@post, @post_comment), params: { post_comment: { body: @post_comment.body } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post_comment" do
    assert_difference("PostComment.count", -1) do
      delete post_comment_url(@post, @post_comment)
    end

    assert_redirected_to post_url(@post)
  end
end
