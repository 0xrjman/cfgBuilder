get-lint:
	curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s latest

.PHONY: lint
lint:
	if [ ! -f ./bin/golangci-lint ]; then \
		$(MAKE) get-lint; \
	fi;
	./bin/golangci-lint run ./... --timeout 5m0s

install:
	@echo "  > Installing cfgBuilder... "
	go install

build:
	@echo "  > Building cfgBuilder... "
	go build -o  build/cfgBuilder

clean:
	rm -rf build/
