class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		if not current_user.company.nil?
			your_solutions_company_path(current_user.company)
		else
			new_company_path
		end
	end

	protected
	# Get unique clients that have been validated at least one solution of the company
	def set_clients solutions
		clients_array = []
		solutions.each do |solution|
			clients_array << solution.client_ids unless solution.clients.empty?
		end
		ids = clients_array.flatten.uniq
		@clients_all = Client.where(id: ids)
	end
end
