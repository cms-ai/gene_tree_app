.PHONY: clean

# Clean dự án
clean:
	flutter clean

# setup project trước khi run app
.PHONY: setup
setup:
	bash ./bin/setup.bash

# Build APK hoặc iOS
.PHONY: build-android-dev
build:
	flutter build apk --release

# Chạy test unit
.PHONY: test
test:
	flutter test

.PHONY: build-runner
# Build runner cho project
build-runner:

# khởi tạo intl	
.PHONY: generate
generate:
	bash ./bin/generate_intl/generate_intl.bash

.PHONY: generate_asset
generate_asset:
	bash ./bin/generate_asset/generate_asset.bash

.PHONY: gen_image
gen_image:
	bash ./bin/generate_asset/generate_image.bash

.PHONY: gen_icon
gen_icon:
	bash ./bin/generate_asset/generate_icon.bash

# Chạy ứng dụng trên thiết bị kết nối
.PHONY: run
run:
	flutter run
