#!/bin/bash
set -e

# 创建临时目录
mkdir -p sources/{istore,small-package}

# 克隆仓库并删除.git
git clone --depth 1 https://github.com/linkease/istore.git sources/istore
rm -rf sources/istore/.git

git clone --depth 1 https://github.com/kenzok8/small-package.git sources/small-package
rm -rf sources/small-package/.git

# 过滤small-package
filter_small_package() {
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
}

# 执行过滤
filter_small_package

# 合并目录
mkdir -p sources/iStore
cp -r sources/istore/* sources/iStore/
cp -r sources/small-package/* sources/iStore/

# 清理临时文件
rm -rf sources/{istore,small-package}
