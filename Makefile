.PHONY: help install build run stop rebuild test clean migrate-up

help:
	@echo "Available commands:"
	@echo "  start        Start docker service"
	@echo "  stop         Stop doker services"
	@echo "  run          Run the application"
	@echo "  test         Run tests"
	@echo "  fmt          Format the code"

start:
	docker compose up -d

stop:
	docker compose down

run:
	go run -race cmd/slx/main.go

test:
	go test -v ./...

fmt:
	goimports -w .
