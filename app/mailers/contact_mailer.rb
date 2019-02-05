class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact_one.subject
  #

  default to: "partnergoodprueba@gmail.com"

  def new_contact_one(data_params)
    # Send email with phone number
  	@greeting = data_params
    mail from: "client_phone@email.com", subject: "Contacto YeahThem"
  end

  def new_contact_two(data_params)
    # Send email with message
    @greeting = data_params
    mail from: data_params[:email], subject: "Contacto YeahThem"
  end

  def new_contact_company(data_params)
    # Send email to a company
    @greeting = data_params
    mail from: data_params[:email], subject: "Contacto YeahThem", to: data_params[:email_company]
  end

  def new_access_request(data_params)
    # Send a email for request accesss
    @greeting = data_params
    mail from: data_params[:email], subject: "YeahThem"
  end

  def new_business_request(data_params)
    # Send a email for request accesss
    @greeting = data_params
    mail from: data_params[:email], subject: "YeahThem Desarrollo de negocio"
  end

  def new_software_request(data_params)
    # Send a email for request accesss
    @greeting = data_params
    mail from: data_params[:email], subject: "YeahThem Desarollo de Software"
  end
end
