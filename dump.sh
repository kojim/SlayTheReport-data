#!/bin/sh

aws dynamodb scan --table-name SlayTheReport-author-v1p > author.json

for i in `seq 0 9`; do

  echo ${i}...
  aws dynamodb scan --table-name SlayTheReport-v3p --total-segments 10 --segment ${i} > data${i}.json
  sleep 120
done
