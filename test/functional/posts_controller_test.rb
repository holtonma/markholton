require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  
  test "index should have menu" do
    get :index
    assert_response :success
    
    # four options
    assert_select 'div#nav1 ul' do
      assert_select 'li', 4
    end
    # no menu option on Posts#index
    # 4 options should not be current 
    assert_select 'div#nav1 ul' do
      assert_select 'li.page_item', 4
    end
    
  end
  
  test "posts#index should show no more than 10 posts at a time" do
    get :index
    assert_response :success
    
    assert_select 'div#centercol' do
      assert_select 'h4', 10
      assert_select 'hr', 10
    end
    
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should have a link to read more that points to About" do
    get :index
    assert_response :success
    
    assert_select "div#logo a[href$=#{about_path}]"
  end
  
  test "should not create post if missing title" do
    assert_no_difference('Post.count') do
      post :create, :post => {
        :title   => '',
        :content => posts(:one).content,
        :name    => posts(:one).name
      }
    end
    
    assert_response :success #HTTP 200
    assert_template :new
  end
  
  test "should create post if all the required params are there" do
    assert_difference('Post.count') do
      post :create, :post => { 
        :title   => posts(:one).title, 
        :content => posts(:one).content,
        :name    => posts(:one).name 
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, :id => posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => posts(:one).to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => posts(:one).to_param, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).to_param
    end

    assert_redirected_to posts_path
  end
end