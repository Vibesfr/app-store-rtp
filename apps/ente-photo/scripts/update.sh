#!/bin/bash

# Stop the services
docker-compose down

# Pull new images
docker-compose pull

# Start services
docker-compose up -d

echo "Ente Photos updated successfully!"
