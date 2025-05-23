require 'httparty'
require 'json'

class RestfulBookerClient
  include HTTParty
  base_uri 'https://restful-booker.herokuapp.com'

  def initialize
    @headers = { 'Content-Type' => 'application/json' }
    authenticate
  end

  def authenticate(user: 'admin', pass: 'password123')
    resp = self.class.post(
      '/auth',
      body: { username: user, password: pass }.to_json,
      headers: @headers
    )
    @token = resp.parsed_response['token']
    @auth_header = @headers.merge('Cookie' => "token=#{@token}")
    resp
  end

  def create_booking(body)
    self.class.post('/booking', body: body.to_json, headers: @headers)
  end

  def get_booking(id)
    self.class.get("/booking/#{id}", headers: @headers)
  end

  def update_booking(id, body)
    self.class.put("/booking/#{id}", body: body.to_json, headers: @auth_header)
  end

  def delete_booking(id)
    self.class.delete("/booking/#{id}", headers: @auth_header)
  end

  private

  def handle_response(response)
    return response unless response.respond_to?(:parsed_response)
    response.parsed_response
  end
end
