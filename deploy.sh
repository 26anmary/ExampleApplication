#!/usr/bin/env bash

set -e

cd /home/ubuntu/ExampleApplication

echo "Installing application dependencies..."
npm install

echo "Restarting application..."
if pm2 describe example_app >/dev/null 2>&1; then
    pm2 restart example_app
else
    pm2 start ./bin/www --name example_app --env production
fi

pm2 save

echo "Deployment completed successfully!"
