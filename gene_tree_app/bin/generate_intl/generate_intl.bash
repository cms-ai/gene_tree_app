#!/bin/bash

# Đường dẫn đến template pubspec.yaml
TEMPLATE_PATH="bin/templates/intl/pubspec.yaml.tmpl"

# Tìm tất cả các module trong thư mục lib/modules
MODULES=($(find lib/modules -mindepth 1 -maxdepth 1 -type d -exec basename {} \;))

# Hàm tạo pubspec.yaml cho từng module
generate_pubspec_for_module() {
  local module_name=$1
  local path_arb="l10n/arbs"
  local path_generated="l10n/generated"
  
  # Chuyển đổi chữ cái đầu tiên thành chữ hoa
  local class_name="$(tr '[:lower:]' '[:upper:]' <<< "${module_name:0:1}")${module_name:1}Localizations"
  
  # Kiểm tra xem thư mục arbs có tồn tại không
  if [ ! -d "lib/modules/$module_name/$path_arb" ]; then
    echo "Bỏ qua module $module_name do không tìm thấy thư mục $path_arb"
    return
  fi

  # Đường dẫn pubspec.yaml cho module
  local pubspec_path="lib/modules/$module_name/pubspec.yaml"

  # Đọc template và thay thế các biến
  sed -e "s/\$TAG_MODULE/$module_name/g" \
      -e "s|\$PATH_ARB|$path_arb|g" \
      -e "s|\$PATH_GENERATED|$path_generated|g" \
      -e "s/\$CLASS_NAME/$class_name/g" \
      "$TEMPLATE_PATH" > "$pubspec_path"

  echo "Đã tạo $pubspec_path cho module $module_name"
}

# Tạo pubspec.yaml và chạy intl_utils cho từng module
for module_name in "${MODULES[@]}"; do
  generate_pubspec_for_module "$module_name"
  
  # Di chuyển đến thư mục module và chạy intl_utils nếu pubspec.yaml đã được tạo
  pushd "lib/modules/$module_name" > /dev/null
  if [ -f "pubspec.yaml" ]; then
    # Cài đặt lại dependencies và tạo mã dịch tự động
    flutter pub get
    flutter pub run intl_utils:generate
  fi
  popd > /dev/null

  # Xóa .dart_tool, pubspec.lock và pubspec.yaml sau khi đã gen xong
  rm -rf "lib/modules/$module_name/.dart_tool"
  rm -f "lib/modules/$module_name/pubspec.lock"
  rm -f "lib/modules/$module_name/pubspec.yaml"
  
  echo "Đã xóa các file không cần thiết cho module $module_name"
done

echo "Đã hoàn tất quốc tế hóa và dọn dẹp cho tất cả các module trong lib/modules."
