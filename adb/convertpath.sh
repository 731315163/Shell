#! /bin/bash
path=""
tolpath(){  
  #拿到:前的盘符
  a=${path%:*}
  #转换为小写字母
  a=$(echo $a | tr '[A-Z]' '[a-z]')
  #拿到:后的路径
  b=${path#*:}
  #拼接字符
  url="/mnt/"$a$b
  #替换路径分割符，并赋值给变量path
  path=${url//'\'/'/'}
}
