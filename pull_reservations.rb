require 'faraday'
require 'json'

PAGE_SIZE = 200

connection = Faraday.new(
  url: 'https://app.beyondvip.com',
  params: {format: :json, auth_token: 'ZBbWnHfuBFHpHb9skAMV'},
  headers: {'Content-Type' => 'application/json'}) do |faraday|

  faraday.response :logger
  faraday.adapter  Faraday.default_adapter
end

updated_today = "2014-06-28" # for example
all_reservations, current_reservations = [], []
page_number = 0

begin
  page_number += 1
  response = connection.get 'api/v1/reservations', page: page_number, updated_since: updated_today
  current_reservations = JSON.parse(response.body)
  all_reservations += current_reservations
end until current_reservations.size < PAGE_SIZE

puts "pages count: #{page_number}"
puts "reservations count: #{all_reservations.count}"

