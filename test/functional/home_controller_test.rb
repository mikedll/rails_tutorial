require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "home is available" do
    get :index
    assert_select "h1", /Welcome/
  end
  
end
