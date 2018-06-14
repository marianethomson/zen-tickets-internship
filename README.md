# zen-tickets-internship

This project is a simple ticket viewer to connect with the Zendesk API, using Rails.

# Features:
The ticket viewer allows you to:
* Connect to de Zendesk API
* Request all the tickets for your account
* Display them in a list of 25 tickets per page
* Display individual ticket details

# How to run locally:

1. First, clone the repository to your local machine.
2. Run the command bundle install to install the dependencies.
3. Run rails server to start the server
4. The application will be available at http://localhost:3000/ 

# License:
The source code is released under the MIT License.

# Design Decisions and General Comments:
I decided to use a web-framework to avoid dealing with some low level details and focus on the application code itself. Despite Rails is a potent framework, probably more suited for a larger project, I decided to keep it. I tried to use Sinatra but I was losing a lot of time making things that work in Rails work again in Sinatra, instead of refactoring my code. So, I decided for Rails to use my development time for a better code in a framework I'm more used to.

