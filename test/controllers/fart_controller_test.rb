require 'test_helper'

class FartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fart_index_url
    assert_response :success
  end

end
