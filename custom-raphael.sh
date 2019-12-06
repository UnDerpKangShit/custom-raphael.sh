#!/bin/bash

echo "Select the config : "
echo "1. FIX BUILD COMPILE ISSUES"
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
    
    repopick -t telephony ten-qc-telephony-ext fod-stuff

fi

echo "Cloning Done!"
