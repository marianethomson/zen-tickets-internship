require_relative 'tickets_controller.rb'
require 'io/console'

loop do
  puts "Please choose one of the following options"
  puts "1. List Tickets"
  puts "2. Next Tickets Page"
  puts "3. Previous Ticket Page"
  puts "4. Show Full Ticket (by ID)"
  puts "5. Exit"

  controller = TicketsController.new
  input = gets.chomp.to_i

  case input
    when 1
      puts controller.list_tickets
    when 2
      puts controller.next_page 
    when 3
      puts controller.previous_page
    when 4
      puts "Please inform the ticket number"
      STDOUT.flush
      id = input
      puts id
      puts controller.ticket
    when 5
      exit
    else
      puts "Invalid option. Please try again."
  end
end
