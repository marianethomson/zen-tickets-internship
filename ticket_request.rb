require 'httparty'

class TicketRequest

  EMAIL='marianedinis@gmail.com'
  PASSWORD='codingchallenge2018'

  def initialize
    @auth = { username: EMAIL,
              password: PASSWORD }
  end

  BASE_URL = "https://internship2018.zendesk.com/api/v2/"

  def tickets(page)
    page = params[:page] || 1
    response = connection(BASE_URL+"tickets.json?page=#{page}&sort_by=id&sort_order=desc")
    tickets = response['tickets']

    { tickets: tickets.map { |ticket| new_ticket (ticket) },
      page: page,
      count: response['count'] }
  end

  def ticket(id)
    ticket = connection(BASE_URL+"tickets/#{id}.json")['ticket']
    new_ticket(ticket)
  end

  private

  def connection(url)
    begin
      response = HTTParty.get(url, basic_auth: @auth)
    rescue Timeout::Error, Errno::ECONNRESET, Errno::EINVAL,
        Errno::ECONNRESET, EOFError, Net::HTTPBadResponse,
        Net::HTTPHeaderSyntaxError, Net::ProtocolError,SocketError => e
      raise HTTParty::Error.new(e.message)
    end
    raise HTTParty::Error.new('Bad response') unless response.success?
    response
  end


  def new_ticket(ticket)
    Ticket.new(ticket['id'],
               ticket['subject'],
               ticket['description'],
               ticket['requester_id'],
               ticket['assignee_id'],
               ticket['created_at'],
               ticket['updated_at'],
               ticket['status'])
  end
end