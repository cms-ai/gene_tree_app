#!/bin/bash

# Danh sách môi trường
echo "Chọn môi trường để build:"
echo "1) Development (dev)"
echo "2) Production (prod)"
read -p "Nhập số (1-2): " env_choice

# Xác định môi trường
case $env_choice in
    1)
        FLAVOR="dev"
        ;;
    2)
        FLAVOR="prod"
        ;;
    *)
        echo "Lựa chọn không hợp lệ! Thoát..."
        exit 1
        ;;
esac

Chọn loại build
echo "Chọn loại build:"
echo "1) APK (debug)"
echo "2) APK (release)"
echo "3) AAB (release - dùng cho Google Play)"
read -p "Nhập số (1-3): " build_choice


# Xác định loại build
case $build_choice in
    1)
        BUILD_CMD="flutter build apk --flavor $FLAVOR --debug"
        APP_NAME="Gene Tree $FLAVOR"
        ;;
    2)
        BUILD_CMD="flutter build apk --flavor $FLAVOR --release"
        APP_NAME="Gene Tree $FLAVOR"
        ;;
    3)
        BUILD_CMD="flutter build appbundle --flavor $FLAVOR --release"
        APP_NAME="Gene Tree"
        ;;
    *)
        echo "Lựa chọn không hợp lệ! Thoát..."
        exit 1
        ;;
esac

# Chạy lệnh build
echo "🚀 Bắt đầu build: $BUILD_CMD"
echo "Thiết lập icon cho ứng dụng..."
sed -i '' "s|image_path: .*|image_path: \"assets/icons/ic_logo_${FLAVOR}.png\"|g" pubspec.yaml
flutter pub run flutter_launcher_icons
echo "Hoàn thành thiết lập icon cho ứng dụng"

# Cập nhật tên app trong pubspec.yaml
# echo "🔄 Đổi tên app trong pubspec.yaml..."
# sed -i '' "s|name: .*|name: \"$APP_NAME\"|g" pubspec.yaml

# Cập nhật tên app trong AndroidManifest.xml
echo "🔄 Đổi tên app trong AndroidManifest.xml..."
sed -i '' "s|android:label=\".*\"|android:label=\"$APP_NAME\"|g" android/app/src/main/AndroidManifest.xml

# Cập nhật tên app trong Info.plist (iOS)
# echo "🔄 Đổi tên app trong Info.plist..."
# sed -i '' "s|<string>.*</string>|<string>$APP_NAME</string>|g" ios/Runner/Info.plist

echo "✅ Đã đổi tên app thành \"$APP_NAME\" thành công!"
# $BUILD_CMD

# Kiểm tra lỗi
if [ $? -eq 0 ]; then
    echo "✅ Build thành công!"
else
    echo "❌ Build thất bại! Kiểm tra lại lỗi."
    exit 1
fi
