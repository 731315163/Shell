#! /bin/bash
sign(){
  apksignerDir='D:\Sdk\build-tools\27.0.3'
  apksigner='\lib\apksigner.jar'
  key='D:\Resource\KeyStore\user.keystore'
  apk='D:\Soft\ApkTool\android.apk'
  #java.exe -Djava.ext.dirs=$apksignerDir -jar -Duser.language=en $apksignerDir$apksigner $1 $2
  java.exe -Djava.ext.dirs=$apksignerDir -jar -Duser.language=en $apksignerDir$apksigner sign -ks $key $apk
}
sign 