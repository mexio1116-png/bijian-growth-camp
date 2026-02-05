#!/bin/bash

# 笔尖成长营 - GitHub Pages 修复脚本
# 这个脚本会修复路径问题并重新部署

echo "🔧 修复GitHub Pages路径配置..."

# 1. 创建临时目录
TEMP_DIR="/tmp/bijian-growth-camp-fix"
rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

# 2. 复制网站文件
cp /home/admin/clawd/bijian-growth-camp-v2/asset-manifest.json $TEMP_DIR/
cp /home/admin/clawd/bijian-growth-camp-v2/index.html $TEMP_DIR/
cp -r /home/admin/clawd/bijian-growth-camp-v2/static $TEMP_DIR/

# 3. 修复index.html中的路径
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
git commit -m "Fix GitHub Pages path issues"

# 8. 推送到GitHub
git remote add origin https://mexio1116-png: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@github.com/mexio1116-png/bijian-growth-camp.git
git push -f origin main

echo ""
echo "✅ 修复完成！"
echo "🌐 你的网站将在几分钟后正常工作："
echo "   https://mexio1116-png.github.io/bijian-growth-camp/"
echo ""
echo "💡 如果还有问题，请刷新页面或清除浏览器缓存。"