require 'test_helper'

class IndustryBranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a industry branch" do
    i = industries(:one) # Using the industries.yml file
    i_branch = IndustryBranch.new(industry_id: i.id, name: "tax")
    assert i_branch.save
  end

  test "it should not create a industry branch wihout a industry_id" do
    i_branch = IndustryBranch.new(name: "tax")
    assert_not i_branch.save
  end

  test "it should not create a industry branch wihout a name" do
    i = industries(:one)
    i_branch = IndustryBranch.new(industry_id: i.id)
    assert_not i_branch.save
  end
end
