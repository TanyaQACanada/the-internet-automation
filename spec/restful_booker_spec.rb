require 'spec_helper'
require_relative '../lib/restful_booker_client'

RSpec.describe 'Restful Booker API' do
  before(:all) do
    @client = RestfulBookerClient.new
    auth = @client.authenticate
    expect(auth.code).to eq(200)
    @booking_payload = {
      firstname:      'Tanya',
      lastname:       'Kosachova',
      totalprice:     150,
      depositpaid:    true,
      bookingdates:   { checkin: '2025-05-01', checkout: '2025-05-02' },
      additionalneeds: 'Breakfast'
    }
    resp = @client.create_booking(@booking_payload)
    expect(resp.code).to eq(200)
    @booking_id = resp.parsed_response['bookingid']
  end

  it 'retrieves the created booking' do
    resp = @client.get_booking(@booking_id)
    expect(resp.code).to eq(200)
    booking = resp.parsed_response
    expect(booking['firstname']).to eq('Tanya')
  end

  it 'updates the booking' do
    updated = @booking_payload.merge(firstname: 'Updated')
    resp = @client.update_booking(@booking_id, updated)
    expect(resp.code).to eq(200)
    booking = resp.parsed_response
    expect(booking['firstname']).to eq('Updated')
  end

  it 'deletes the booking' do
    resp = @client.delete_booking(@booking_id)
    expect(resp.code).to eq(201)  # API returns 201 for successful deletion
  end

  it 'returns 404 after deletion' do
    resp = @client.get_booking(@booking_id)
    expect(resp.code).to eq(404)
  end
end
