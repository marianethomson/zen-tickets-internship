require 'json'
require './ticket_request.rb'

class Ticket

  attr_reader :id, :subject, :description, :requester_id, :assignee_id, :created_at, 
  :updated_at, :status

  def initialize(id, subject, description, requester_id, assignee_id, created_at, updated_at, status)
    @id           = id
    @subject      = subject
    @description  = description
    @requester_id = requester_id
    @assignee_id  = assignee_id
    @created_at   = created_at
    @updated_at   = updated_at
    @status       = status
    @tickets      << self
  end 
  
  ZENDESK_RESPONSE = 100 #default response size
  MAX_LIMIT = 25 # desired response size

  def parse(response)
    parsed_response = JSON.parse(response.body)
  end

  def get_tickets(page)
    tickets = []
    formatted_page = (page.to_f / (ZENDESK_RESPONSE/PAGE_LIMIT)).ceil
    tickets_response = parse(connection.("tickets.json?page=#{formatted_page}&sort_by=id&sort_order=desc"))['tickets']
    @tickets = { tickets: tickets.map { |ticket| new_ticket(ticket) },
      formatted_page: formatted_page,
      count: tickets_response['count'] }
  end

  def get_ticket
    ticket = parse(connection.("tickets/#{id}.json"))['ticket']
    new_ticket(id)
  end

  def number_of_pages(tickets)
    count = parse['count']
    @number_of_pages = (count[:count].to_f / PAGE_LIMIT).ceil
  end

  def pagination(number_of_pages)
    result = get_tickets(number_of_pages)
    if result[:formatted_page] > 1
      start = 0 + (number_of_pages.to_i - 1) * PAGE_LIMIT - ZENDESK_RESPONSE * (result[:formatted_page] - 1)
    else
      start = 0 + (number_of_pages.to_i - 1) * PAGE_LIMIT # For page 1 of results
    end
    tickets = result[:tickets]
    { tickets: tickets[start..start + 24], count: result[:count] }
  end

  def show_tickets(tickets)
    @page = params[:page] || 1
    @tickets.each do |ticket|
      puts "Id: #{ticket.id}"
      puts "subject: #{ticket.subject}"
    end  
  end
  
  def show_ticket(ticket)
    puts new_ticket
  end  

  private
  def connection
    @connection = TicketRequest.new
  end

  def new_ticket
    Ticket.new(ticket['subject'], ticket['description'], ticket['submitter_id'],
               ticket['created_at'], ticket['updated_at'], ticket['status'],
               ticket['id'])
  end
end