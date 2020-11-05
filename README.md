# Business Intelligence with Apache Druid 
## druid-tutorial
DSC Europe 2020 - Technical Tutorial

## Prerequisites
- Linux, Mac OS X, or other Unix-like OS (Windows is not supported)
- Java 8, Update 92 or later (8u92+)

## Installation
```
export DRUID_VERSION=0.19.0
wget https://downloads.apache.org/druid/$DRUID_VERSION/apache-druid-$DRUID_VERSION-bin.tar.gz
tar -xzf apache-druid-$DRUID_VERSION-bin.tar.gz
rm apache-druid-$DRUID_VERSION-bin.tar.gz
cd apache-druid-$DRUID_VERSION
```

## Starting up
### Micro-quickstart mode
```
./bin/start-micro-quickstart
```

## Open the Druid console
Visit [http://localhost:8888](http://localhost:8888) in browser.

## Running Druid in Docker
```
cd docker

mkdir storage
chmod 755 storage
sudo chown 1000:1000 storage

export DRUID_VERSION=0.19.0
docker-compose up
```
Visit [http://localhost:8888](http://localhost:8888) in browser.

## Prepare PostgreSQL sample OLTP database
AdventureWorks OLTP sample available [here](https://github.com/morenoh149/postgresDBSamples/tree/master/adventureworks).
```
docker cp oltp-db/ postgres:/home
docker exec -it postgres bash -m "/home/oltp-db/load-data.sh"
```
Then run command from oltp-db/load-data.sh.

## Ingestion
### Ingest data from OLTP to Druid database
```
curl -X 'POST' -H 'Content-Type:application/json' -d @spec/spec-wo.json 'http://localhost:8888/druid/indexer/v1/task'
```

### Ingestion Schema
Sample ingestion schema specifications are in `spec` directory.
Schema specifications:
* index: `index_parallel`
* input source type: `sql`

### Druid's data model
Druid data is stored in datasources, which are similar to tables in a traditional RDBMS.

### Primary timestamp
Druid schemas must always include a primary timestamp. It is used for partitioning and sorting data.
It is specified in the `timestampSpec`.

### Dimensions
Dimensions - columns from SQL query, specified in the `dimensionSpec`.
Data type of dimension could be `string`, `long`, `float`, or `double`.

### Metrics
Metrics - columns that are stored in an aggregated form. 
A list of aggregators to apply at ingestion time are specified in the `metricSpec`.

NOTE: Dimension and metric names are case insensitive.

## Rollup
Rollup is a form of summarization or pre-aggregation.
When rollup is enabled, then any rows that have identical dimensions and timestamp to each other (after `queryGranularity`-based truncation) can be collapsed, or rolled up, into a single row in Druid.
Rollup is controlled by the `rollup` setting in the `granularitySpec`. By default, it is `true` (enabled).

## Partitioning - TODO
PartitionsSpec is used to describe the secondary partitioning method.
Dynamic, hash-based, and range-based partitioning methods are available.

## Querying - TODO
Apache Druid supports two query languages: Druid SQL and native queries.

## Updating existing data - TODO

## Deleting data
Permanent deletion of a Druid segment has two steps:
- The segment must first be marked as "unused". This occurs when a user manually disables a segment through the Coordinator API.
- After segments have been marked as "unused", a Kill Task will delete any "unused" segments from Druid's metadata store as well as deep storage.

## Combination with Metabase - TODO
