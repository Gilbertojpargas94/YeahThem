require 'json'
require 'base64'

class OmniauthController < ApplicationController
    def callback
        oauth = auth_hash
        params = params_hash
        token = oauth[:credentials][:token]
        request = Faraday.new
        response = request.get do |req| 
            req.url 'https://api.linkedin.com/v1/people/~:(positions)', {oauth2_access_token: token}
            req.headers['x-li-format'] = 'json'
        end

        extra_data = position_data(response.body)

        print(response.body)
        print("******** RESPONSE ************")

        @client = Client.from_omniauth(oauth)

        if @client.persisted?
            if @client.update(company_name: extra_data[:company_name], title: extra_data[:title])
                print("ATRIBUTOS: ", @client.attributes)
                redirect_to validate_solution_path(id: params["solution_id"], client_id: Base64.encode64(@client.id.to_s))
            else
                flash[:alert] = "Ha ocurrido un problema con la autenticacion."
            end
        end
    end
    
    def failure
        flash[:alert] = "Ha ocurrido un error al tratar de autenticar tu cuenta"
        redirect_to solution_path(id: params_hash["solution_id"])
    end

    private
     def position_data response
        convert_response = JSON.parse(response)
        if convert_response['positions']['_total'] == 0
            data = {company_name: "", title: ""}
        else
            values = convert_response['positions']['values']
            data = {
                company_name: values[0]['company']['name'],
                title: values[0]['title']
            }
        end
        return data
     end

     def auth_hash
        request.env['omniauth.auth']
     end

     def params_hash
        request.env['omniauth.params']
     end
end