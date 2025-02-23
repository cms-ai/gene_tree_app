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
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: run_flutterfire
run_flutterfire:
	bash ./bin/firebase/flutterfire-config.sh $(ENV)
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

.PHONY: create_template
template:
	dart ./bin/create_files_template/create_templates.dart
	flutter pub run build_runner build --delete-conflicting-outputs

# Chạy ứng dụng trên thiết bị kết nối
.PHONY: run
run:
	flutter run
