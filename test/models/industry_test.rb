require 'test_helper'

class IndustryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a industry" do
    i = Industry.new(name: "law")
    assert i.save
  end

  test "it not should create a industry without name" do
    assert_not Industry.new().save
  end
end
