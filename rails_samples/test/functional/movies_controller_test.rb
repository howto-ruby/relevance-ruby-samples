require File.expand_path(File.join(File.dirname(__FILE__), "..", "test_helper")) 

class MoviesControllerTest < ActionController::TestCase
  fixtures :movies

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
    assert_select "h1", "Movie List" 
    assert_select "ol li" 
  end

  def test_get_new
    get :new
    assert_response :success
    assert_not_nil assigns(:movie)
    assert_select "form" 
  end

  def test_create_html
    post :create, :movie => {:title => "Test Name", :year => "2006"}
    assert_response :redirect
    assert_not_nil assigns(:movie)
    assert_nil assigns(:movies)
    assert_redirected_to :action => "index" 
  end

  def test_create_js
    xhr :post, :create, :movie => {:title => "Test Name", :year => "2006"}
    assert_response :success
    assert_not_nil assigns(:movies)
    # Consider: Why are these assert_rjs calls less than ideal?
    # What could you do about it?
    assert_rjs :replace, "movie_list" 
    assert_rjs :replace, "add_movie" 
  end
end
