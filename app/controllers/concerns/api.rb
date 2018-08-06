module Api

	def self.do_request(url, params={})
	  binding.pry
	  encrypted={}
	  encrypted[:data]=params
	  url = url + '?' + encrypted.to_query
	  uri = URI.parse(url)
	  response = Net::HTTP.get_response(uri)
	  JSON.parse(response) if response
	  binding.pry
	end
end