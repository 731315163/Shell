#!/bin/bash
unity=/mnt/d/Soft/Unity/5.6.3f1/Editor/Unity.exe
unityproject=D:/Project/UnityProject/TowerCrush
apkname=android.apk
method=BuildProject.BuildAndroid
apktoolWin=D:\Soft\ApkTool
apktoolLin=/mnt/d/Soft/ApkTool
$unity -projectPath $unityproject -executeMethod $method -quit
 
echo "Apk生成完毕"