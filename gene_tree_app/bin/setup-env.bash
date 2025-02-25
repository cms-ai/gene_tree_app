#!/bin/bash

# Danh sách môi trường
echo "Chọn môi trường để build:"
echo "1) Development (dev)"
echo "2) Production (prod)"
echo "2) Production (inhouse)"
read -p "Nhập số (1-2): " env_choice

# Xác định môi trường
case $env_choice in
    1)
        FLAVOR="dev"
        ;;
    2)
        FLAVOR="prod"
        ;;
    3)
        FLAVOR="prod"
        ;;
    *)
        echo "Lựa chọn không hợp lệ! Thoát..."
        exit 1
        ;;
esac

# Chọn loại build
# echo "Chọn loại build:"
# echo "1) APK (debug)"
# echo "2) APK (release)"
# echo "3) AAB (release - dùng cho Google Play)"
# read -p "Nhập số (1-3): " build_choice


# Xác định loại build
case $env_choice in
    1)
        BUILD_CMD="flutter build apk --flavor $FLAVOR --debug"
        APP_NAME="Gene Tree $FLAVOR"
        APP_ID="com.aigenetreemobile.dev"
        PACKAGE_NAME="com.aigenetreemobile.dev"

        ;;
    2)
        BUILD_CMD="flutter build apk --flavor $FLAVOR --release"
        APP_NAME="Gene Tree $FLAVOR"
        APP_ID="com.aigenetreemobile.dev"
        PACKAGE_NAME="com.aigenetreemobile.prod"
        ;;
    3)
        BUILD_CMD="flutter build appbundle --flavor $FLAVOR --release"
        APP_NAME="Gene Tree"
        APP_ID="com.aigenetreemobile.prod"
        PACKAGE_NAME="com.aigenetreemobile.prod"
        ;;
    *)
        echo "Lựa chọn không hợp lệ! Thoát..."
        exit 1
        ;;
esac

# Chạy lệnh build
echo "🚀 Bắt đầu thiết lập môi trường: $FLAVOR"
echo "Thiết lập icon cho ứng dụng..."
sed -i '' "s|image_path: .*|image_path: \"assets/icons/ic_logo_${FLAVOR}.png\"|g" pubspec.yaml
flutter pub run flutter_launcher_icons
echo "Hoàn thành thiết lập icon cho ứng dụng"

# Đổi package name
echo "🔄 Đổi package name và app ID..."
flutter pub run change_app_package_name:main $PACKAGE_NAME

# Cập nhật tên app trong pubspec.yaml
# echo "🔄 Đổi tên app trong pubspec.yaml..."
# sed -i '' "s|name: .*|name: \"$APP_NAME\"|g" pubspec.yaml

# Cập nhật tên app trong AndroidManifest.xml
echo "🔄 Đổi tên app trong AndroidManifest.xml..."
sed -i '' "s|android:label=\".*\"|android:label=\"$APP_NAME\"|g" android/app/src/main/AndroidManifest.xml


# Đổi applicationId trong build.gradle
echo "🔄 Cập nhật applicationId trong build.gradle..."
sed -i '' "s|applicationId \".*\"|applicationId \"$APP_ID\"|g" android/app/build.gradle

# 🛠️ Cập nhật android:name trong AndroidManifest.xml
sed -i '' "s/android:name=\"[^\"]*\.MainActivity\"/android:name=\"$APP_ID.MainActivity\"/" android/app/src/main/AndroidManifest.xml


echo "✅ Đã đổi tên app thành \"$APP_NAME\" thành công!"
# $BUILD_CMD

# Kiểm tra lỗi
if [ $? -eq 0 ]; then
    echo "✅ Build thành công!"
else
    echo "❌ Build thất bại! Kiểm tra lại lỗi."
    exit 1
fi
