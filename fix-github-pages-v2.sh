#!/bin/bash

# 笔尖成长营 - GitHub Pages 完整修复脚本
# 包含CSS样式测试

echo "🔧 部署完整版本到GitHub Pages..."

# 1. 创建临时目录
TEMP_DIR="/tmp/bijian-growth-camp-complete"
rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

# 2. 复制所有文件
cp /home/admin/clawd/bijian-growth-camp-v2/asset-manifest.json $TEMP_DIR/
cp /home/admin/clawd/bijian-growth-camp-v2/index.html $TEMP_DIR/
cp /home/admin/clawd/bijian-growth-camp-v2/simple-test.html $TEMP_DIR/
cp -r /home/admin/clawd/bijian-growth-camp-v2/static $TEMP_DIR/

# 3. 修复路径
sed -i 's|/static/|./static/|g' $TEMP_DIR/index.html
sed -i 's|/favicon.ico|./favicon.ico|g' $TEMP_DIR/index.html

# 4. 进入临时目录
cd $TEMP_DIR

# 5. 初始化Git
git init
git checkout -b main

# 6. 配置Git
git config user.email "mexio1116-png@users.noreply.github.com"
git config user.name "mexio1116-png"

# 7. 添加和提交
git add .
git commit -m "Complete deployment with CSS fix"

# 8. 推送到GitHub
git remote add origin https://mexio1116-png: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@github.com/mexio1116-png/bijian-growth-camp.git
git push -f origin main

echo ""
echo "✅ 部署完成！"
echo "🌐 主网站: https://mexio1116-png.github.io/bijian-growth-camp/"
echo "🧪 测试页面: https://mexio1116-png.github.io/bijian-growth-camp/simple-test.html"
echo ""
echo "💡 如果主网站仍有问题，请先访问测试页面确认CSS是否正常工作。"