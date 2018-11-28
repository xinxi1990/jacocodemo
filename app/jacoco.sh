#!/usr/bin/env bash
#当前在环境为Project/app目录
rm -f build/outputs/code-coverage/connected/coverage.ec
adb pull /sdcard/jacoco/coverage.ec build/outputs/code-coverage/connected/

#gradle createDebugCoverageReport -p `pwd`/app
#gradle jacocoTestReport -p `pwd`/app --stacktrace
