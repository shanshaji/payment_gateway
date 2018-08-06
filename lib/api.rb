module Api

def self.do_request(url, params={})
  request = request + '?' + params.to_query
  uri = URI.parse(request)
  response = Net::HTTP.get_response(uri)
  JSON.parse(response) if response
end