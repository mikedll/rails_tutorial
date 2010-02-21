require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "create" do
    c = <<-CONTENT
    My date was awesome. Her name was Kerry. She likes the same things I like.
    
    We are looking forward to see each other again.
    CONTENT
    post :create, { :name => "First Post", :title => "Went on a date", :content => c }
    assert_response :created
  end
  
  test "create with bad data" do
    post :create, { :name => "nothing here", :title => "trt", :content => "The title of my post is too short" }
    assert_response :bad_request
  end
end
