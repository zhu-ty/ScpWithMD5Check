# $1 = user@ip
# $2 = target dir
# $3 = local dir
# $4 = decoded frams (0 = all)

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
    #./__11__scp.sh $1 $i $3/$filename

    #Added decode code
    if [ $4 -eq 0 ];then
        ssh $1 "DecoderGPU $i"
    else
        ssh $1 "DecoderGPU $i 0 $4"
    fi
    ./__11__scp.sh $1 "${i%.*}.h264" $3/${filename%.*}.h264
    ffmpeg -y -i $3/${filename%.*}.h264 -vcodec copy $3/${filename%.*}.mp4
    rm $3/${filename%.*}.h264
done