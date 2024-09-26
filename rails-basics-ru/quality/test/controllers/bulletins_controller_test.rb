require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'Open home pages' do
    get root_url

    assert_response :success
    assert_select 'h1', 'Home'
  end

  test 'One bulletin open' do
    bulletin = Bulletin.create(title: 'Title 1', body: 'Body 1', published: true);

    get bulletin_url(bulletin.id)

    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select '.body', 'Body 1'
    assert_select '.published', 'Published: yes'
  end

  test 'Open one bulletin from fixture' do
    bulletin = bulletins(:bulletin1)

    get bulletin_url(bulletin.id)

    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select '.body', 'Body 1'
    assert_select '.published', 'Published: yes'
  end
end
