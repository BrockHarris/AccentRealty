class CommunitiesController < ApplicationController
	require 'open-uri'
	def show
		@load_map_script = true
    @community = Community.find(params[:id])

    api_key = "4yjfsrqmcctaqqlx5axebgxx"
    @request_city = @community.city.tr(' ', '+')
    request_url = "http://api.greatschools.org/schools/nearby?key=#{api_key}&city=#{@request_city}&state=CT&minimumSchools=8&radius=10&limit=9"
    @school_data_request = Nokogiri::XML(open("#{request_url}"))
  end
end
