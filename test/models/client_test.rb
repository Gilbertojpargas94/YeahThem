require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "it should create a client" do
    assert Client.new(person_id: 1).save
  end

  test "it should allow create a client without a person_id" do
    assert Client.new(person_id: "foo").save
  end
  
  test "it should has show all clients that validated" do
    client_one = Client.create(person_id: 1)
    sol = solutions(:one)
    sol2 = solutions(:for_benefit_test)
    sol.save
    sol2.save

    client_one.solutions << sol
    client_one.solutions << sol2
    client_one.save
    print(client_one.solution_ids)
    assert_equal sol.clients.first.id, sol2.clients.first.id
  end

  test "it should allow create a client with omniauth data" do
    client = Client.new(
      uid: "123asfs", provider: "linkedin", name: "Linked", last_name: "in", image_url:"http://imagen.com/img.png",
      profile_url: "www.profile.com/perfil", raw_data: {email: "co@correo.com", location: "Venezuela", other: "cualquier vaina"}
    )
    assert client.save
  end

  test "it should update the company name and title after create" do
    raw_data = {email: "co@correo.com", location: "Venezuela", other: "cualquier vaina"}
    client = Client.new(
      uid: "123asfs", provider: "linkedin", name: "Linked", last_name: "in", image_url:"http://imagen.com/img.png",
      profile_url: "www.profile.com/perfil", raw_data: raw_data.to_json
    )
    client.save
    client.update(company_name: "empresa", title: "puesto")
    print(client.attributes)
    assert_equal client.company_name, "empresa"
  end
end
