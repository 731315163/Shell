#! /bin/bash
source convertpath.sh
#反编译

apktoolDir='D:\Soft\ApkTool'
apkname='\android.apk'
apksaveDir=${apkname%.*}

decompile(){
   java.exe -jar -Duser.language=en $apktoolDir'\apktool.jar' d -f $apktoolDir$apkname -o $apktoolDir$apksaveDir
}


#替换so
path=$apktoolDir'\libunity.so'
tolpath
sopath=$path
path=$apktoolDir$apksaveDir'\lib\armeabi-v7a'
tolpath
libpath=$path

copyso(){
  cp -f $sopath $libpath
  echo '替换so文件'
}

#echo `cmp -l /mnt/d/Soft/ApkTool/android/lib/armeabi-v7a/libunity.so /mnt/d/Soft/ApkTool/libunity.so`
#再次编译
compile(){
    java.exe -jar -Duser.language=en $apktoolDir'\apktool.jar' b -f $apktoolDir$apksaveDir -o $apktoolDir$apkname
}
