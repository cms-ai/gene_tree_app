
#!/bin/bash

echo "======== Generating assets ==========="
# khởi tạo image assets
make gen_image

# khởi tạo icon assets
make gen_icon
echo "======== Generate assets succesfully ================"