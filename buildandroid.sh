#!/bin/bash
unity=/mnt/d/Soft/Unity/5.6.3f1/Editor/Unity.exe
unityproject=D:/Project/UnityProject/TowerCrush
method='BuildProject.BuildAndroid'
$unity -projectPath $unityproject -executeMethod $method -quit

echo "Apk生成完毕"