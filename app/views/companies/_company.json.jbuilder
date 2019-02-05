json.extract! company, :id, :user_id, :name, :description, :address, :logo,:total_validation, :status, :created_at, :updated_at
json.url company_url(company, format: :json)
