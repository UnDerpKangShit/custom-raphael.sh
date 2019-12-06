#!/bin/bash

echo "Select the config : "
echo "1. FIX BUILD COMPILE ISSUES"
read config

if [ $config = 1 ]
then
    git fetch https://github.com/kunalshah912/platform_frameworks_base.git ten
    git cherry-pick 7e403f15d68dcec813d439092295e841f859ec47
    git cherry-pick e1b3b4646f630aaa7da20b45aeb840905ce1be7e
    git cherry-pick 8821b7aaf4520d29fd78bae5681003442f6b55b1
    git cherry-pick 5a5ea8bc35a121fde1ea9248873c781520314971
    git cherry-pick d59a4a1a49b6ff2525a5b409a479d8b70bbe13ac
    git cherry-pick 871c07a5ade398033a2b2827174c52b196de99a1
fi

echo "cherry-pick Done!"
