#!/usr/bin/env bash
#当前在环境为Project/app目录

apk_path=`pwd`/app/build/outputs/apk/app-debug.apk
report_path=`pwd`/reporter/index.html

echo "打包app"
gradle assembleDebug
adb uninstall com.weex.jasso
echo "安装app"
adb install ${apk_path}
echo "启动app"
adb shell am start -W -n com.weex.jasso/.Test1Activity -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000
sleep 2
echo "关闭app"
adb shell am force-stop com.weex.jasso


rm -rf `pwd`/new.ec
rm -rf `pwd`/report
adb pull /sdcard/jacoco/coverage.ec `pwd`/new.ec

macaca coverage -r java -f `pwd`/new.ec -c `pwd`/app/build/intermediates/classes/debug -s `pwd`/app/src/main/java --html `pwd`/reporter
echo "jacoco报告地址:"${report_path}
open -a "/Applications/Safari.app" ${report_path}