json.extract! solution, :id, :company_id, :title, :description, :picture, :num_validation, :validated, :status, :created_at, :updated_at
json.branch do
    json.name solution.industry_branches.first.name
end
json.url solution_url(solution, format: :json)
