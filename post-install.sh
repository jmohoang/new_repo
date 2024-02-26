#!/bin/bash

# Install dependencies
bundle install

# Set up the database
rails db:create
rails db:migrate

# Start the server
rails server 
