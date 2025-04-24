#!/bin/bash
set -e

# 清理旧数据
rm -rf sources
mkdir -p sources

# 克隆并清理.git
clone_repo() {
  repo_url=$1
  target_dir=$2
  
  echo "Cloning $repo_url..."
  git clone --depth 1 $repo_url $target_dir
  rm -rf "$target_dir/.git"
}

clone_repo https://github.com/linkease/istore.git sources/istore
clone_repo https://github.com/kenzok8/small-package.git sources/small-package

# 过滤small-package
cd sources/small-package

keep_folders=(
  istoreenhance
  luci-app-istoredup
  luci-app-istoreenhance
  luci-app-istorego
  luci-app-istorepanel
  luci-app-istorex
  luci-app-quickstart
  quickstart
  vmease
)

# 创建临时目录
mkdir -p ../temp

# 移动需要保留的目录
for folder in "${keep_folders[@]}"; do
  if [ -d "$folder" ]; then
    mv "$folder" ../temp/
  fi
done

# 清理并替换
cd ..
rm -rf small-package
mv temp small-package

# 合并目录
mkdir -p iStore
cp -r istore/* iStore/
cp -r small-package/* iStore/

# 最终清理
cd ..
rm -rf sources/{istore,small-package}
