require 'test_helper'

class BenefitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "It should create a Benefit" do
    sol = solutions(:for_benefit_test)
    assert Benefit.new(solution_id: sol.id, description: "description", validated: 1).save
  end

  test "It should not create a Benefit without a solution" do
    assert_not Benefit.new(description: "description", validated: 1).save
  end
end
