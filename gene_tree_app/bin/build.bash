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

        ;;
    2)
        BUILD_CMD="flutter build apk --flavor $FLAVOR --release"
        ;;
    3)
        BUILD_CMD="flutter build appbundle --flavor $FLAVOR --release"
        ;;
    *)
        echo "Lựa chọn không hợp lệ! Thoát..."
        exit 1
        ;;
esac
echo "🚀 Bắt đầu build cho $FLAVOR..."
$BUILD_CMD

# Kiểm tra lỗi
if [ $? -eq 0 ]; then
    echo "✅ Build thành công!"
else
    echo "❌ Build thất bại! Kiểm tra lại lỗi."
    exit 1
fi
