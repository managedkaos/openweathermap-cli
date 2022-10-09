TARGETS=build test clean all
.PHONY: $(TARGETS)

build:
	@which carton || echo 'Carton is not installed.'
	carton install

test:
	carton exec ./weather London Paris 'New York City' 'Los Angeles'

clean:
	rm -rvf ./local ./cpanfile.snapshot

all: build test

