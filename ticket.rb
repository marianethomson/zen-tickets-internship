require 'json'
require_relative 'ticket_request.rb'

class Ticket
  attr_accessor :id,
                :subject,
                :description,
                :requester_id,
                :assignee_id,
                :created_at,
                :updated_at,
                :status

  def initialize(id, subject, description, requester_id, assignee_id, created_at, updated_at, status)
    @id = id
    @subject = subject
    @description = description
    @requester_id = requester_id
    @assignee_id = assignee_id
    @created_at = created_at
    @updated_at = updated_at
    @status = status
  end

  PAGE_LIMIT = 25
  ZENDESK_RESPONSE = 100

  def self.ticket_list(page)
    @formatted_page = (page.to_f / (ZENDESK_RESPONSE/PAGE_LIMIT)).ceil 
    request = TicketRequest.new
    result = request.tickets(page)
    if result[:formatted_page] > 1
      start = 0 + (page.to_i - 1) * 25 - 100 * (result[:formatted_page] - 1)
    else
      start = 0 + (page.to_i - 1) * 25 # page 1 of results
    end
    tickets = result[:tickets]
    { tickets: tickets[start..start + 24], count: result[:count] }
  end

  def number_of_pages(count)
    @num_of_pages = (result[:count].to_f / PAGE_LIMIT).ceil
  end  

  def self.single_ticket(id)
    request = TicketRequest.new
    request.ticket(id)
  end
end
