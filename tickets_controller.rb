require_relative './ticket.rb'

class TicketsController

  def ticket_list(page, tickets)
      @page = params[:page] || 1
      result = Ticket::show_tickets(tickets)
      @tickets = result[:tickets]
  end    

  def next_page(page, number_of_pages)
    if page <= number_of_pages
      next_page = page + 1
    else
      puts "There are no more pages to show."
    end
  end
    
  def previous_page(page_number_of_pages)
    if number_of_pages > 1
      previous_page = page - 1
    else
      puts "There is no previous previous page."
    end
  end

  def ticket(id)
    if not @tickets
      puts "There is no ticket with this id. Please try again."
    else
      @ticket = Ticket::show_ticket(params[:id])
    end
  end
end