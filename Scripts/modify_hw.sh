#!/bin/bash
cd ~/openwrt
rm -rf tmp-awesome
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/AUTHOR/AWESOME-PACKAGE tmp-awesome
cd tmp-awesome
git sparse-checkout init --cone
git sparse-checkout set package/awesome
git checkout main
cd ..
rm -rf package/awesome
mv tmp-awesome/package/awesome package/
rm -rf tmp-awesome
echo "Update completed! Run 'make package/awesome/compile' to rebuild"
