@echo off  
set UNITY_PATH=D:\Soft\Unity\5.6.3f1\Editor\Unity.exe  
set PROJECT_PATH=D:\Project\UnityProject\TowerCrush
set LOG_PATH=D:\unity_log.txt  
set METHOD_NAME=BuildProject.BuildAndroid  
  
%UNITY_PATH% -projectPath %PROJECT_PATH% -executeMethod %UNITY_METHOD_NAME%  
  
if %errorlevel% == 0 (echo ���óɹ�) else (echo ����ʧ�ܣ���鿴unity_log.txt)  