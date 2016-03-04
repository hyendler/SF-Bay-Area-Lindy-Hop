require 'json'
require 'net/http'

class Event < ActiveRecord::Base
	def self.retrieve_events
		url = "https://www.googleapis.com/calendar/v3/calendars/fq1r9h2re21pe3er28s2ga7r2k@group.calendar.google.com/events"
		response=self.get_api_response(url)
	end

	def self.get_api_response(url)
		uri = URI.parse(URI.encode(url))
		api_response = Net::HTTP.get(uri)
		JSON.parse(api_response)
	end


  # t.string :name, {null: false, limit: 100}
  #     t.string :address, {null: false}
  #     t.string :day, {null: false, limit: 20}
  #     t.string :url
  #     t.string :facebook
  #     t.string :time, {null: false}
  #     t.float :lat, {null: false}
  #     t.float :lng, {null: false}
end


#driver code
puts Event.retrieve_events

