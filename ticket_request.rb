require 'net/http'

class TicketRequest

  SUBDOMAIN="internship2018"
  EMAIL='marianedinis@gmail.com'
  PASSWORD='codingchallenge2018'

  ERROR_MESSAGE = 'Ops, something went wrong. Please try again.'

  def url(endpoint)
    URI("https://#{SUBDOMAIN}.zendesk.com/api/v2/#{endpoint}")
  end

  private

  def get(endpoint)
    uri = url(endpoint)
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new(uri)
      request.basic_auth EMAIL, PASSWORD
      status = http.status
        if response.status.to_i === 200
          response = http.request request
        return response
        else
          puts ERROR_MESSAGE + status   
        end
    end
  end  
end
