# zen-tickets-internship

This project is a simple ticket viewer to connect with the Zendesk API, using Sinatra.

# Features:
The ticket viewer allows you to:
* Connect to de Zendesk API
* Request all the tickets for your account
* Display them in a list of 25 tickets per page
* Display individual ticket details

# How to access on the web:

This project is deployed at <a href>ticket-viewer-zendesk.herokuapp.com</a>.

# How to run locally:

1. First, clone the repository to your local machine.
# 2. Run bundle to install the dependencies.
# 3. Run rails s to start the server
4. The application will be available at http://localhost:3000/ 

# License:
The source code is released under the MIT License.

# Design Decisions and General Comments:
I decided to use a web-framework to avoid dealing with some low level details and focus on the application code itself. Despite having used Rails for a previous Zendesk coding challenge, I decided to change the framework to Sinatra due to its strenghts, in special its simplicity to catch data. I realize now that Rails would be better fit for a larger application, or one that require some database manipulation.
