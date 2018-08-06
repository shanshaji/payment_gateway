module Api

	def self.do_request(url, params={})
	  encrypted={}
	  encrypted[:data]=params
	  url = url + '?' + encrypted.to_query
	  uri = URI.parse(url)
	  response = Net::HTTP.get_response(uri)
	  JSON.parse(response) if response
	end
end