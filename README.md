# Pathfinder

A dbt project for building a Pathfinder 1e bestiary from structured seed data and derived models.

## Current scope

The project currently models an initial vertical slice of one creature, starting with a goblin, and is designed to grow toward a fuller bestiary over time.

## Current resources

### Seeds

- `monster_core`
- `monster_stats`

### Models

- `stg_monster_base`

### Macros

- `ability_modifier`
- `generate_schema_name`

## Current design approach

This project separates:

- base creature facts
- ability scores
- derived values

The goal is to avoid storing redundant calculated fields when they can be derived through dbt models and macros.

## Branch flow

This repository uses a promotion flow of:

- feature branches → `dev`
- `dev` → `uat`
- `uat` → `main`

Branch protection and workflow checks are configured so that:

- only `dev` may be merged into `uat`
- only `uat` may be merged into `main`

## Status

Current progress includes:

- initial dbt project setup
- seed creation for core monster data and stats
- data quality tests on seeds
- staging model for base monster assembly
- ability modifier derivation through macro

## Next steps

Planned next work includes:

- additional monster entities and source rows
- adjustment/modifier modeling
- further derived combat and bestiary layers
- expansion beyond the initial goblin seed
