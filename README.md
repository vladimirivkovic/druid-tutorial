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

### Dimensions and Metrics
Dimensions - columns from SQL query.
Metrics - columns that are stored in an aggregated form.
NOTE: Dimension and metric name specification is case insensitive.

## Rollup - TODO

## Querying - TODO

## Updating existing data - TODO

## Combination with Metabase - TODO
