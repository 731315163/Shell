#!/bin/bash
build(){
  unity=/mnt/d/Soft/Unity/5.6.3f1/Editor/Unity.exe
  method='BuildProject.BuildAndroid'
  echo $1
  #$1 为unity项目路径
  $unity -projectPath $1 -executeMethod $method -quit
  echo "Apk生成完毕"
}