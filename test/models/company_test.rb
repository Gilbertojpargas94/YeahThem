require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "it should create a Company" do
    user = users(:one)
    company = Company.new(user_id: user.id, name: "name", description: "description")
    user = company.user
    print(user.company.description)
    assert company.save
  end

  test "it not should create a company without user_id" do
    # It cannot create a company without a user_id
    assert_not Company.new(name: "name", description: "description").save
  end

  test "it not should create a company without name" do
    # It cannot create a company without a user_id
    assert_not Company.new(user_id: 1, description: "description").save
  end

  test "it should create a Company with a user" do
    user = users(:one)
    company = Company.new(name: "name", description: "description")
    # user = company.user
    company = user.company
    assert company.save
  end
  
  test "it should add industry for a company" do
    user = users(:one)
    industry = industries(:one)
    company = Company.new(name: "name", description: "description")
    company = user.company
    company.industries << industry
    print(company.industries.last.name)
    assert_equal company.industries.last.id, industry.id
  end 
end
