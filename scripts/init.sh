#!/bin/bash

echo "🐳 Starting services..."
docker compose up -d --build

echo "⏳ Waiting for ClickHouse..."
sleep 10

echo "📥 Running dbt seed..."
docker compose run dbt dbt seed --profiles-dir .

echo "🏗️ Running dbt models..."
docker compose run dbt dbt run --profiles-dir .

echo "🧪 Running tests..."
docker compose run dbt dbt test --profiles-dir .

echo "✅ Setup complete!"
echo "📊 Metabase: http://localhost:3000"