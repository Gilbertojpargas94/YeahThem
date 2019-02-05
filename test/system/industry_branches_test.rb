require "application_system_test_case"

class IndustryBranchesTest < ApplicationSystemTestCase
  setup do
    @industry_branch = industry_branches(:one)
  end

  test "visiting the index" do
    visit industry_branches_url
    assert_selector "h1", text: "Industry Branches"
  end

  test "creating a Industry branch" do
    visit industry_branches_url
    click_on "New Industry Branch"

    fill_in "Industry", with: @industry_branch.industry_id
    fill_in "Name", with: @industry_branch.name
    click_on "Create Industry branch"

    assert_text "Industry branch was successfully created"
    click_on "Back"
  end

  test "updating a Industry branch" do
    visit industry_branches_url
    click_on "Edit", match: :first

    fill_in "Industry", with: @industry_branch.industry_id
    fill_in "Name", with: @industry_branch.name
    click_on "Update Industry branch"

    assert_text "Industry branch was successfully updated"
    click_on "Back"
  end

  test "destroying a Industry branch" do
    visit industry_branches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Industry branch was successfully destroyed"
  end
end
