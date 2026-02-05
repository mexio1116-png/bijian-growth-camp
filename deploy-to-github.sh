#!/bin/bash

# 笔尖成长营 - GitHub Pages 一键部署脚本
# 使用方法: ./deploy-to-github.sh

echo "🚀 开始部署笔尖成长营到GitHub Pages..."

# 1. 创建临时目录
TEMP_DIR="/tmp/bijian-growth-camp-deploy"
rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

# 2. 复制网站文件
cp /home/admin/clawd/bijian-growth-camp-v2/asset-manifest.json $TEMP_DIR/
cp /home/admin/clawd/bijian-growth-camp-v2/index.html $TEMP_DIR/
cp -r /home/admin/clawd/bijian-growth-camp-v2/static $TEMP_DIR/

# 3. 进入临时目录
cd $TEMP_DIR

# 4. 初始化Git仓库
git init
git checkout -b main

# 5. 配置Git
git config user.email "mexio1116-png@users.noreply.github.com"
git config user.name "mexio1116-png"

# 6. 添加文件并提交
git add .
git commit -m "Deploy 笔尖成长营 v1.6.0 to GitHub Pages"

# 7. 创建远程仓库（需要手动在GitHub上创建）
echo ""
echo "📋 请按以下步骤操作："
echo "1. 访问 https://github.com/new"
echo "2. 仓库名称: bijian-growth-camp"
echo "3. 描述: 笔尖成长营 - 智能作文练笔系统"
echo "4. 选择 Public（公开）"
echo "5. 不要初始化 README、.gitignore 或 LICENSE"
echo "6. 点击 'Create repository'"
echo ""
echo "✅ 仓库创建完成后，按 Enter 继续..."
read

# 8. 添加远程仓库并推送
git remote add origin https://github.com/mexio1116-png/bijian-growth-camp.git
git push -u origin main

# 9. 启用GitHub Pages
echo ""
echo "🌐 GitHub Pages 设置："
echo "1. 在GitHub仓库页面，点击 'Settings' 选项卡"
echo "2. 在左侧菜单中找到 'Pages'"
echo "3. 在 'Source' 部分，选择 'Branch: main' 和 '/ (root)'"
echo "4. 点击 'Save'"
echo ""
echo "🎉 部署完成！"
echo "🔗 你的网站将在几分钟后可通过以下URL访问："
echo "   https://mexio1116-png.github.io/bijian-growth-camp/"

# 10. 清理临时文件
rm -rf $TEMP_DIR

echo ""
echo "💡 提示：如果推送时要求输入密码，请使用你的GitHub Personal Access Token作为密码。"