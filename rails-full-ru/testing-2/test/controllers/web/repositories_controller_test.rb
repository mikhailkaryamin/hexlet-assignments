# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  setup do
    @repository = repositories(:one)
    @link = 'https://api.github.com/repos/markets/awesome-ruby'
    @attrs = { link: @link }
  end

  test 'should create' do
    response = load_fixture('files/response.json')

    stub_request(:get, @link)
      .to_return(
        status: 200,
        body: response,
        headers: { 'Content-Type' => 'application/json' }
      )

    post repositories_url, params: { repository: @attrs }

    repository = Repository.find_by @attrs

    assert { repository }
    assert { repository.description.present? }
    assert_redirected_to repository_url(repository)
  end
  # END
end
