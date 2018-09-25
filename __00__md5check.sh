# $1 = user@ip
# $2 = target file
# $3 = local file

#echo $1
#echo $2

p1='$1'
p2='$2'

#md5all_t=`ssh $1 "md5sum $2"`
md5_t=`ssh $1 "md5sum $2 | awk -F ' ' '{print $p1}'"`
md5_local=`md5sum $3 | awk -F ' ' '{print $1}'`

pwd_t=`ssh $1 "md5sum $2 | awk -F ' ' '{print $p2}'"`
pwd_local=`md5sum $3 | awk -F ' ' '{print $2}'`

#echo $md5all_t
#echo $md5_local
#echo $md5_t
echo $pwd_t
echo $pwd_local

if [ $md5_t == $md5_local ]; then
    exit 0
else
    exit 1
fi

#exit 1