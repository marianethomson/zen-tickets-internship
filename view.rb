require_relative 'tickets_controller.rb'
require 'io/console'

loop do
  puts "Please choose one of the following options"
  puts "1. List Tickets"
  puts "2. Next Tickets Page"
  puts "3. Previous Ticket Page"
  puts "4. Show Full Ticket (by ID)"
  puts "5. Exit"

  input = gets.chomp.to_i

  loop do
    case input
      when 1
        TicketsController::ticket_list(page, tickets)
      when 2
        TicketsController::next_page(page, number_of_pages)
      when 3
        TicketsController::previous_page(page, number_of_pages)
      when 4
        puts "Please inform the ticket number"
        id = input
        TicketsController::show_ticket(id)
      when 5
        exit
      else
        puts "Invalid option. Please try again."
        break
    end
  end
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        