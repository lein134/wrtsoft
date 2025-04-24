#!/bin/bash

# 创建目标目录 iStore
mkdir -p iStore

# 输出调试信息
echo "Starting to copy files from small-package..."

# 复制 small-package 中的指定文件夹到 iStore，并输出每次操作
cp -r small-package/istoreenhance iStore/
echo "Copied istoreenhance"
cp -r small-package/luci-app-istoredup iStore/
echo "Copied luci-app-istoredup"
cp -r small-package/luci-app-istoreenhance iStore/
echo "Copied luci-app-istoreenhance"
cp -r small-package/luci-app-istorego iStore/
echo "Copied luci-app-istorego"
cp -r small-package/luci-app-istorepanel iStore/
echo "Copied luci-app-istorepanel"
cp -r small-package/luci-app-istorex iStore/
echo "Copied luci-app-istorex"
cp -r small-package/luci-app-quickstart iStore/
echo "Copied luci-app-quickstart"
cp -r small-package/quickstart iStore/
echo "Copied quickstart"
cp -r small-package/vmease iStore/
echo "Copied vmease"

# 输出调试信息
echo "Starting to copy files from istore repository..."

# 复制 linkease/istore 中的所有文件到 iStore，并输出每次操作
cp -r istore/* iStore/
echo "Copied all files from linkease/istore"

# 完全清理仓库中的 .git 文件夹，避免符号链接和 Git 元数据
echo "Cleaning up .git folder"
rm -rf istore/.git
rm -rf small-package/.git

# 输出 iStore 目录中的文件，确认文件已复制
echo "Files in iStore directory:"
ls iStore/
