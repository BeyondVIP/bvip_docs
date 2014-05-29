require 'faraday'
require 'json'

connection = Faraday.new(
  url: 'https://app.beyondvip.com', 
  params: {format: :json, auth_token: 'ZBbWnHfuBFHpHb9skAMV'}, 
  headers: {'Content-Type' => 'application/json'}) do |faraday|

  faraday.response :logger                  
  faraday.adapter  Faraday.default_adapter  
end

updated_today = "2014-05-28" # for example
all_contacts, current_contacts = [], []
page_number = 0

begin
  page_number += 1
  response = connection.get 'api/v1/contacts', page: page_number, updated_since: updated_today 
  current_contacts = JSON.parse(response.body)
  all_contacts += current_contacts
end until current_contacts.size < 200

puts "pages count: #{page_number}"
puts "contacts count: #{all_contacts.count}"

