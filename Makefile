.PHONY: all
all: test

.PHONY: install-dev-deps
install-dev-deps:
	go install github.com/psampaz/go-mod-outdated@v0.9.0
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.53.3
	go install golang.org/x/tools/cmd/godoc@latest
	@bash -c 'command -v go-licenses > /dev/null || echo -e "\n\n**** Please add ${HOME}/go/bin in the PATH variable."'

.PHONY: test
test:
	go clean -testcache
	go test ./... -mod=vendor
	golangci-lint run
	go list -mod=mod -u -m -json all | go-mod-outdated -update -direct

.PHONY: dep-update
dep-update:
	go get -u ./...
	go mod tidy
	go mod vendor

.PHONY: godoc
godoc:
	$(info Open http://127.0.0.1:6060/pkg/${GO_MODULE}/)
ifdef ($GOROOT,)
	godoc
else
	godoc -goroot /usr/share/go
endif
