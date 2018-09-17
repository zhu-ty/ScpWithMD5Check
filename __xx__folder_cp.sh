# $1 = user@ip
# $2 = target dir
# $3 = local dir

if [ ! -d $3 ];then
    mkdir $3
#else
#    echo "folder exist."
fi

for i in `ssh $1 "ls $2/*.bin"`
do
    #echo $i
    filename=${i##*/} #get file name /xxx/xxx/xxx.bin -> xxx.bin
    #echo $filename
    ./__xx__scp.sh $1 $i $3/$filename
done