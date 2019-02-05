require 'mailgun-ruby'

class ContactsController < ApplicationController
	def new
	end

	def new_contact_modal
		@company = Company.find(params[:id])
		@user = User.find(@company.user_id)
		respond_to do |format|
		    format.js
		 end
	end

	def show
	end

	def new_access_modal
	end

	def create
		from = params
		ContactMailer.new_contact_two(from).deliver_now
		render :show
	end

	def create_with_phone
		from = params
		ContactMailer.new_contact_one(from).deliver_now
		render :show
	end

	def company
		from = params
		ContactMailer.new_contact_company(from).deliver_now
		redirect_back fallback_location: root_path, notice: 'Tu mensaje ha sido enviado satisfactoriamente'
	end

	def access_request
		from = params
		ContactMailer.new_access_request(from).deliver_now
		
		respond_to do |format|
			format.js {}
		end
	end

	def business_request
		from = params
		ContactMailer.new_business_request(from).deliver_now
		
		respond_to do |format|
			format.js {}
		end
	end

	def software_request
		from = params
		ContactMailer.new_software_request(from).deliver_now
		
		respond_to do |format|
			format.js {}
		end
	end
end
