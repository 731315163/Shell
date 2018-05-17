#! /bin/bash
path=""
tolpath(){  
  a=${path%:*}
  a=$(echo $a | tr '[A-Z]' '[a-z]')
  b=${path#*:}
  url="/mnt/"$a$b
  url=${url//'\'/'/'}
  echo $url
}
