#! /bin/bash
source convertpath.sh
source buildandroid.sh
source apktool.sh
source apksigner.sh
unityproject='D:\Project\UnityProject\HelixJumpPackageV6'
build $unityproject
path=$unityproject
tolpath
lunityproject=$path'/android.apk'
path=$apktoolDir
tolpath
lapktoolDir=$path
cp -f $lunityproject $lapktoolDir
decompile
copyso
compile
sign
source installapk.sh