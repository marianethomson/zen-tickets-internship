require_relative 'ticket.rb'

class TicketsController
  include HTTParty::Error, with: :error

  def list_tickets
    result = Ticket.ticket_list(@formatted_page)
    @tickets = result[:tickets]
  end

  def next_page
    if @page.to_i < @number_of_pages
      @page.to_i + 1 
    end
  end

  def previous_page
    if @number_of_pages.to_i - 1 >= 1 
      @page.to_i - 1 
    end
  end

  def ticket
    @ticket = Ticket.single_ticket(params[:id])
  end

  def error
    puts 'Ops, something went wrong. Please try again.'
  end
end