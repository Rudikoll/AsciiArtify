APP_NAME=asciiartify
IMAGE_TAG=quay.io/rudikoll/asciiartify:latest

GO=go
BUILD_DIR=build

.PHONY: all clean linux windows macos arm docker-build docker-run

all: clean linux

linux:
	GOOS=linux GOARCH=amd64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-linux .

windows:
	GOOS=windows GOARCH=amd64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-windows.exe .

macos:
	GOOS=darwin GOARCH=amd64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-macos .

arm:
	GOOS=linux GOARCH=arm64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-arm .

docker-build:
	docker build -t $(IMAGE_TAG) .

docker-run:
	docker run --rm $(IMAGE_TAG)

clean:
	rm -rf $(BUILD_DIR)
	docker rmi -f $(IMAGE_TAG) || true