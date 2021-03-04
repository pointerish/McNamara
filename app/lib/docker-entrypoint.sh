#!/bin/sh
# https://stackoverflow.com/a/38732187/1935918
set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

bundle exec rake db:migrate RAILS_ENV=production 2>/dev/null || bundle exec rails db:environment:set RAILS_ENV=production

exec bundle exec "$@"