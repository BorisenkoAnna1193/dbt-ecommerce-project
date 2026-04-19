#!/bin/bash

echo "🚀 Running dbt pipeline..."

docker compose run dbt dbt run --profiles-dir .
docker docker compose upcompose run dbt dbt test --profiles-dir .

echo "✅ Done!"