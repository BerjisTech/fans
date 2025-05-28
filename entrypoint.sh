#!/usr/bin/env bash
set -e

# If Rails app is not present, generate a new one with PostgreSQL
if [ ! -f ./config/application.rb ]; then
  echo "Initializing new Rails application with PostgreSQL..."
  rails new . --force --database=postgresql --css=tailwind --skip-bundle --skip-git
  bundle install
fi

# Execute the container's main process (what's set as CMD in the Dockerfile)
exec bundle exec "$@"