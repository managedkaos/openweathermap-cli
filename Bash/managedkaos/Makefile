TARGETS=build test clean all
.PHONY: $(TARGETS)

build:
	@which bash || echo 'bash is not installed.'

test:
	./weather London Paris Boston Edinburgh

clean:
	@echo "No clean step is needed."

all: build test

