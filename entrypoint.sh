#!/bin/bash
set -e

#Rake db migrate
bundle exec rake db:migrate 2>/dev/null

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec bundle exec "$@"