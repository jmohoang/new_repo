#!/bin/bash

# Generate Good Job installation
echo "Generating Good Job installation..."
rails g good_job:install

# Run database migrations
echo "Running database migrations..."
rails db:migrate

echo "Good Job installation and database migrations complete!"
