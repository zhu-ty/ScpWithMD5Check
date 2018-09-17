# $1 = user@ip
# $2 = target file
# $3 = local file

if [ ! -f $3 ];then
#echo "文件不存在"
    #rsync -av --progress $1:$2 $3
    rsync --progress $1:$2 $3
else
    ./__xx__md5check.sh $1 $2 $3
    ans=$?
    if [ $ans -eq 0 ];then
        echo "md5 matched, pass"
    else
        echo "md5 mismatch, re-copy"
        rsync --progress $1:$2 $3
    fi
fi