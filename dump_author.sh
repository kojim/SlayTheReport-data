#!/bin/sh

aws dynamodb scan --table-name SlayTheReport-author-v1p > data/author.json

