#!/bin/bash

# Generate random passwords if not provided
if [ -z "$ENTE_DB_PASSWORD" ]; then
    export ENTE_DB_PASSWORD=$(openssl rand -base64 32)
fi

if [ -z "$ENTE_S3_ACCESS_KEY" ]; then
    export ENTE_S3_ACCESS_KEY=$(openssl rand -hex 16)
fi

if [ -z "$ENTE_S3_SECRET_KEY" ]; then
    export ENTE_S3_SECRET_KEY=$(openssl rand -base64 32)
fi

if [ -z "$ENTE_JWT_SECRET" ]; then
    export ENTE_JWT_SECRET=$(openssl rand -base64 64)
fi

# Create necessary directories
mkdir -p "${APP_DATA_DIR}/data/server"
mkdir -p "${APP_DATA_DIR}/data/postgres"
mkdir -p "${APP_DATA_DIR}/data/minio"

# Set proper permissions
chown -R 1000:1000 "${APP_DATA_DIR}/data"

echo "Ente Photos installation completed!"
echo "Database password: $ENTE_DB_PASSWORD"
echo "S3 Access Key: $ENTE_S3_ACCESS_KEY"
echo "S3 Secret Key: $ENTE_S3_SECRET_KEY"
echo "JWT Secret: $ENTE_JWT_SECRET"
