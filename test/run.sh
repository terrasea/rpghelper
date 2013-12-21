#!/bin/bash

sudo start xvfb

#which content_shell
#if [[ $? -ne 0 ]]; then
#    $DART_SDK/../chromium/download_contentshell.sh
#    unzip content_shell-linux-x64-release.zip

#    cs_path=$(ls -d drt-*)
#    PATH=$cs_path:$PATH
#fi

#results=$(content_shell --dump-render-tree test/index.html 2>&1)
results=$(DumpRenderTree test/index.html 2>&1)
echo -e "$results"

# check to see if DumpRenderTree tests
# fails, since it always returns 0
if [[ "$results" == *"Some tests failed"* ]]
then
    exit 1
fi

if [[ "$results" == *"Exception: "* ]]
then
    exit 1
fi

