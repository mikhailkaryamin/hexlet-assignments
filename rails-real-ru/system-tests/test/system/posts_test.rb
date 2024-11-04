# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end


  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_on 'New Post'
    fill_in 'Title', with: @post.title
    fill_in 'Body', with: @post.body
    click_on 'Create Post'
    assert_text 'Post was successfully created.'
  end

  test 'should show post' do
    visit post_url(@post)
    assert_selector 'h1', text: @post.title
  end

  test 'should edit post' do
    visit post_url(@post)
    click_on 'edit-post'
    fill_in 'Title', with: "some new Title"
    fill_in 'Body', with: "some new Body"
    click_on 'Update Post'
    assert_text 'Post was successfully updated.'
  end

  test 'should destroy post' do
    visit post_url(@post)
    accept_alert 'Are you sure?' do
      click_on 'Delete'
    end
    assert_text 'Comment was successfully destroyed.'
  end
end
# END
