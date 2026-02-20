# Binary name
BINARY_NAME=ground-ctl

# Go related variables
GO_CMD=go
GO_BUILD=$(GO_CMD) build
GO_CLEAN=$(GO_CMD) clean
GO_TEST=$(GO_CMD) test
GO_RUN=$(GO_CMD) run
MAIN_PATH=cmd/groundctl/main.go

.PHONY: all build run clean test help

all: build

build:
	$(GO_BUILD) -o bin/$(BINARY_NAME) $(MAIN_PATH)

run:
	$(GO_RUN) $(MAIN_PATH)

test:
	$(GO_TEST) -v ./...

clean:
	$(GO_CLEAN)
	rm -rf bin/

install-tools:
	go install github.com/spf13/cobra-cli@latest


help:
	@echo "Available targets:"
	@echo "  build   : Build the application"
	@echo "  run     : Run the application"
	@echo "  test    : Run tests"
	@echo "  clean   : Remove binary and build artifacts"
	@echo "  install-tools   : Install necessary tools for development"
	@echo "  help    : Show this help message"