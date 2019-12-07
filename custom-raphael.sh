#!/bin/bash

echo "Select the config : "
echo "1. FIX BUILD COMPILE ISSUES"
echo "2. FIX + FULL DT+Kernel+Vendor clone"
echo "3. clone DT+Kernel+Vendor"
read config

if [ $config = 1 ]
then

    rm -rf vendor/qcom/opensource/fm-commonsys
    git clone https://github.com/raphael-development/android_vendor_qcom_opensource_fm-commonsys vendor/qcom/opensource/fm-commonsys
    rm -rf vendor/nxp/opensource/sn100x/halimpl
    rm -rf vendor/nxp/opensource/commonsys/external/libnfc-nci
    rm -rf vendor/nxp/opensource/commonsys/frameworks
    rm -rf vendor/nxp/opensource/commonsys/packages/apps/Nfc
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_halimpl -b lineage-17.0-sn100x vendor/nxp/opensource/sn100x/halimpl
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_external_libnfc-nci -b lineage-17.0 vendor/nxp/opensource/commonsys/extern$
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_frameworks -b lineage-17.0 vendor/nxp/opensource/commonsys/frameworks
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_packages_apps_Nfc -b lineage-17.0 vendor/nxp/opensource/commonsys/packages$
    
    . build/envsetup.sh
    repopick -t telephony ten-qc-telephony-ext fod-stuff
    
    cd frameworks/base
    git fetch https://github.com/kunalshah912/platform_frameworks_base.git ten
    git cherry-pick 7e403f15d68dcec813d439092295e841f859ec47
    git cherry-pick e1b3b4646f630aaa7da20b45aeb840905ce1be7e
    git cherry-pick 8821b7aaf4520d29fd78bae5681003442f6b55b1
    git cherry-pick 5a5ea8bc35a121fde1ea9248873c781520314971
    git cherry-pick d59a4a1a49b6ff2525a5b409a479d8b70bbe13ac
    git cherry-pick 871c07a5ade398033a2b2827174c52b196de99a1
    
    cd ../../
fi

if [ $config = 2 ]
then
    rm -rf vendor/qcom/opensource/fm-commonsys
    git clone https://github.com/raphael-development/android_vendor_qcom_opensource_fm-commonsys vendor/qcom/opensource/fm-commonsys
    rm -rf vendor/nxp/opensource/sn100x/halimpl
    rm -rf vendor/nxp/opensource/commonsys/external/libnfc-nci
    rm -rf vendor/nxp/opensource/commonsys/frameworks
    rm -rf vendor/nxp/opensource/commonsys/packages/apps/Nfc
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_halimpl -b lineage-17.0-sn100x vendor/nxp/opensource/sn100x/halimpl
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_external_libnfc-nci -b lineage-17.0 vendor/nxp/opensource/commonsys/external/libnfc-nci
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_frameworks -b lineage-17.0 vendor/nxp/opensource/commonsys/frameworks
    git clone https://github.com/raphael-development/android_vendor_nxp_opensource_packages_apps_Nfc -b lineage-17.0 vendor/nxp/opensource/commonsys/packages/apps/Nfc
    
    repopick -t telephony ten-qc-telephony-ext fod-stuff
    
    cd frameworks/base
    git fetch https://github.com/kunalshah912/platform_frameworks_base.git ten
    git cherry-pick 7e403f15d68dcec813d439092295e841f859ec47
    git cherry-pick e1b3b4646f630aaa7da20b45aeb840905ce1be7e
    git cherry-pick 8821b7aaf4520d29fd78bae5681003442f6b55b1
    git cherry-pick 5a5ea8bc35a121fde1ea9248873c781520314971
    git cherry-pick d59a4a1a49b6ff2525a5b409a479d8b70bbe13ac
    git cherry-pick 871c07a5ade398033a2b2827174c52b196de99a1
    
    cd ../../
    
    git clone https://github.com/kunalshah912/android_device_xiaomi_raphael.git -b derpfest device/xiaomi/raphael
    git clone https://github.com/kunalshah912/proprietary_vendor_xiaomi.git -b derpfest vendor/xiaomi
    git clone https://github.com/dragonGR/xiaomi_sm8150.git -b q10.0 kernel/xiaomi/raphael
fi

if [ $config = 3 ]
then
    git clone https://github.com/kunalshah912/android_device_xiaomi_raphael.git -b derpfest device/xiaomi/raphael
    git clone https://github.com/kunalshah912/proprietary_vendor_xiaomi.git -b derpfest vendor/xiaomi
    git clone https://github.com/dragonGR/xiaomi_sm8150.git -b q10.0 kernel/xiaomi/raphael
fi
echo "Cloning Done!"
