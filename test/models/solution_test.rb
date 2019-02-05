require 'test_helper'
 
class SolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "it should create a Solution" do
    user = users(:one)
    company = companies(:for_solution_test)
    sol = Solution.new(
      company_id: company.id, 
      title: "title", 
      description:"description"
    )
    assert sol.save
  end

  test "it should not create a solution without a company_id" do
    sol = Solution.new( 
      title: "title", 
      description:"description"
    )
    assert_not sol.save
  end
  
  test "it should not create a solution without a title" do
    sol = Solution.new( 
      company_id: 1,
      description:"description"
    )
    assert_not sol.save
  end

  test "it should has show all clients that validated" do
    client_one = clients(:one)
    client_two = clients(:two)
    company = companies(:for_solution_test)
    sol = Solution.new(
      company_id: company.id, 
      title: "title", 
      description:"description"
    )
    
    sol2 = Solution.new(
      company_id: company.id, 
      title: "title 2", 
      description:"another description"
    )
    sol.clients << client_one
    sol.clients << client_two
    sol2.clients << client_one
    
    sol.save
    sol2.save
   
    print(client_one.solution_ids)

    assert_equal sol.clients.first.id, sol2.clients.last.id
  end

  test "it should add a industry branch" do
    indus_branch_one = industry_branches(:one)
    indus_branch_two = industry_branches(:two)
    company = companies(:for_solution_test)
    
    indus_branch_one.save
    indus_branch_two.save
    
    sol = Solution.new(
      company_id: company.id, 
      title: "title", 
      description:"description"
    )

    sol2 = Solution.new(
      company_id: company.id, 
      title: "title 2", 
      description:"another description"
    )
    
    sol.industry_branches << indus_branch_one
    sol2.industry_branches << indus_branch_one

    sol.save
    sol2.save

    assert_equal sol.industry_branches.last.id, sol2.industry_branches.last.id 
  end

  test "it should add many benefits to one project" do
    company = companies(:for_solution_test)
    sol = Solution.new(
      company_id: company.id, 
      title: "title", 
      description:"description"
    )
    sol.save
    benefit_one = sol.benefits.create(description: "benefit one")
    benefit_two = sol.benefits.create(description: "benefit two")
    benefit_three = sol.benefits.create(description: "benefit three")
    
    assert_equal sol.benefits.count, 3
  end
end
