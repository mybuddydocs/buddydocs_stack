require 'test_helper'

class TeamDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_documents_index_url
    assert_response :success
  end

  test "should get show" do
    get team_documents_show_url
    assert_response :success
  end

  test "should get new" do
    get team_documents_new_url
    assert_response :success
  end

  test "should get create" do
    get team_documents_create_url
    assert_response :success
  end

  test "should get edit" do
    get team_documents_edit_url
    assert_response :success
  end

  test "should get update" do
    get team_documents_update_url
    assert_response :success
  end

end
