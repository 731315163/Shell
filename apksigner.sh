#! /bin/bash
sign(){
  apksigner='D:\\Sdk\\build-tools\\27.0.3\\lib\\apksigner.jar'
  key='D:\\Resource\\user.keystore'
  apk='D:\\Soft\\ApkTool\android.apk'
  java.exe -jar $apksigner sign --ks $key --ks-pass pass:q8510912 $apk
  echo '重新签名完毕'
}