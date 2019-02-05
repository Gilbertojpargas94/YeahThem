class RegistrationsController < Devise::RegistrationsController
    def new
    	@home_page = true
        # super is for devise controller work as default
		# super para que el controlador siga haciendo lo que haria el controlador padre
		super
	end

	def create
		super
	end

	def update
		super
	end

	protected
	def after_sign_up_path_for(resource)
		# after a new user is register, is redirect_to a new company path
		new_company_path
	end

	private
    def sign_up_params
        # For assign custom parameters like first and last name
		# Para asignar los parametros de username, ya que devise no lo permitia
		allow = [:email, :first_name, :password, :password_confirmation]
		params.require(resource_name).permit(allow)
	end
end