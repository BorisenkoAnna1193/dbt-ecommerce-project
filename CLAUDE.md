# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run all models
dbt run

# Run a specific model (or tag/path)
dbt run --select stg_orders
dbt run --select staging
dbt run --select marts

# Run tests
dbt test

# Run tests for a specific model
dbt test --select stg_orders

# Load seed data
dbt seed

# Full refresh (rebuild tables from scratch)
dbt run --full-refresh

# Compile without executing
dbt compile

# Generate and serve docs
dbt docs generate
dbt docs serve
```

Target environment is controlled via `--target dev` (default) or `--target prod`.

## Architecture

**Database:** DuckDB (embedded). Dev uses `dev.duckdb`, prod uses `prod.duckdb`. Connection configured in `profiles.yml`.

**Data source:** A single seed file `seeds/quick_commerce.csv` (~948k rows) with Indian quick-commerce order data (Blinkit, Swiggy Instamart, Zepto, etc.).

**Transformation layers** (defined in `dbt_project.yml`):

| Layer | Path | Materialization | Purpose |
|-------|------|----------------|---------|
| Staging | `models/staging/` | views | Standardize raw seed columns; rename, cast, derive keys |
| Intermediate | `models/intermediate/` | views | Enrich by joining staging models |
| Marts | `models/marts/` | tables | Business-ready fact/dimension tables for analytics |

**Data flow:**
```
quick_commerce.csv (seed)
  └─> stg_orders + stg_delivery ──> int_orders_enriched ──> fct_orders
                                                          └─> kpi_metrics
  └─> stg_customers ──────────────────────────────────────> dim_customers
```

**Key models:**
- `int_orders_enriched` — left-joins `stg_orders` and `stg_delivery` on `order_id`; foundation for mart tables
- `fct_orders` — core transactional fact table (order_id, company, city, order_value, delivery metrics)
- `kpi_metrics` — pre-aggregated city/company KPIs for dashboards
- `dim_customers` — customer dimension aggregated by age and city

**Tests** are in `models/schema.yml` (not NULL / unique on key columns) and `tests/no_negative_values.sql` (singular test asserting `order_value >= 0`).
