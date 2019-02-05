require 'test_helper'

class IndustryBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @industry_branch = industry_branches(:one)
  end

  test "should get index" do
    get industry_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_industry_branch_url
    assert_response :success
  end

  test "should create industry_branch" do
    assert_difference('IndustryBranch.count') do
      post industry_branches_url, params: { industry_branch: { industry_id: @industry_branch.industry_id, name: @industry_branch.name } }
    end

    assert_redirected_to industry_branch_url(IndustryBranch.last)
  end

  test "should show industry_branch" do
    get industry_branch_url(@industry_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_industry_branch_url(@industry_branch)
    assert_response :success
  end

  test "should update industry_branch" do
    patch industry_branch_url(@industry_branch), params: { industry_branch: { industry_id: @industry_branch.industry_id, name: @industry_branch.name } }
    assert_redirected_to industry_branch_url(@industry_branch)
  end

  test "should destroy industry_branch" do
    assert_difference('IndustryBranch.count', -1) do
      delete industry_branch_url(@industry_branch)
    end

    assert_redirected_to industry_branches_url
  end
end
