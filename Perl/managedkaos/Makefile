TARGETS=build test clean all
.PHONY: $(TARGETS)

check:
	@which carton || (echo 'carton is not installed' && exit 1)

build: check
	carton install

test:
	carton exec ./weather London Paris 'New York' 'Los Angeles'

clean:
	rm -rvf ./local ./cpanfile.snapshot

all: build test

