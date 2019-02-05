json.extract! benefit, :id, :solution_id, :description, :validated, :created_at, :updated_at
json.solution do
    json.branch_count benefit.solution.benefits.count
end
json.url benefit_url(benefit, format: :json)
