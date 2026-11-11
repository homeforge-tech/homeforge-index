# Validates index.json with the core's own parser (homeforge built from ../homeforge).
HOMEFORGE ?= ../homeforge

.PHONY: check

check:
	cd $(HOMEFORGE) && go build -o $(CURDIR)/.bin/homeforge ./cmd/homeforge
	.bin/homeforge index-check < index.json
